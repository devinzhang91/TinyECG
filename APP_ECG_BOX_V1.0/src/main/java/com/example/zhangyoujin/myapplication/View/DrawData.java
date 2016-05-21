package com.example.zhangyoujin.myapplication.View;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PathEffect;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.widget.LinearLayout;

import com.example.zhangyoujin.myapplication.BLE_PACKAGE.BLEControl;

/**
 * Created by zhangyoujin on 15/9/15.
 */
public class DrawData extends SurfaceView implements SurfaceHolder.Callback, Runnable {

    public int SampleFrequency = 250; //采样频率 Hz
    public static int DataLength = 1024;     //数据池长度，用于时域与频域的数据长度
    private static final int MAX_DATA = 65535;    //最大的数据
    public static final int HALF_MAX_DATA = MAX_DATA / 2;    //最大的数据的一半

    public int Enlarge = 1;          // 放大倍数
    private long oldT;
    private float MAX_KY;
    private float MIN_KY;          //最大的Y轴缩放比例
    private final int outTime = 32; //偏移量最大范围倍数
    private int oldX, oldY;
    private SurfaceHolder holder;
    public int mapH;
    public int mapW;

    public int[] dataInt0 = new int[DataLength];           // data 时域 原数据
    public int[] dataInt1 = new int[DataLength];           // data 时域 一次滤波数据
    public int[] dataIntDraw = new int[DataLength];        // data 时域 画图（二次滤波）的数据
    public float[] fftFloat = new float[DataLength];   // data 频域
    public int dataHead = 0;

    private Canvas c = null;
    private Paint pNet = new Paint();    //创建网格画笔
    private Paint pData = new Paint();   //创建数据画笔
    private Paint pText = new Paint();   //创建文字画笔
    private Paint pSign = new Paint();   //创建标记画笔
    private Path path = new Path();
    public float kY0 = 0.500f;       //数据y轴缩放比例记录(适配数据与屏幕)
    public float kY = 0.500f;        //数据y轴缩放比例
    public int dY = 0;               //数据y轴偏移量
    public float KdY = 0.01f;        //数据y轴偏移量比例
    public int signX = 0;            //标记点
    private float unitX = (float) mapW / (float) DataLength; //单位横坐标
    private Thread thread; // SurfaceView通常需要自己单独的线程来播放动画
    public boolean isRunning = false;


//    public static native int filterForEcg0(int[] array, int header ,int length);    //本地动态库函数名
//    public static native int filterForEcg1(int[] array, int header ,int length);    //本地动态库函数名
//    static {
//        System.loadLibrary("JniFilter");    //加载本地so动态库
//    }

    public DrawData(Context context) {
        super(context);
        holder = this.getHolder();
        holder.addCallback(this);
        pData.setColor(Color.RED); // 画笔颜色
        pData.setStrokeWidth(3);
        LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(
                (int) (MainActivity.SCREEN_WIDTH),
                (int) (MainActivity.SCREEN_HEIGHT * 0.4)
        );
        this.getRootView().setLayoutParams(p);
    }

    @Override
    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        //设置长宽
        mapH = (int) (MainActivity.SCREEN_HEIGHT * 0.4);
        mapW = (int) (MainActivity.SCREEN_WIDTH);
        unitX = (float) mapW / (float) DataLength;
        kY = ((float) mapH / (float) MAX_DATA / 1.050f);    //根据图像高度调整伸缩比例
        kY0 = kY;
        dY = -mapH;
        MAX_KY = kY * 16;
        MIN_KY = kY / 16;
        pNet.setColor(Color.BLACK);
        PathEffect effects = new DashPathEffect(new float[]{5, 5, 5, 5}, 1);
        pNet.setPathEffect(effects);
        pNet.setStrokeWidth(1);
        pData.setColor(Color.RED); // 画笔颜色
        pText.setColor(Color.BLACK);
        pText.setStrokeWidth(5);
        pText.setTextSize(24);
        pSign.setColor(Color.BLUE);
        pSign.setStrokeWidth(2);
        for (int i = 0; i < dataIntDraw.length; i++) {
            dataIntDraw[i] = HALF_MAX_DATA;
        }
        this.thread = new Thread(this);
        this.thread.start();
        isRunning = true;
    }

    @Override
    public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
        Log.v("DrawMap", "surfaceChanged");
    }

    @Override
    public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        Log.v("DrawMap", "surfaceDestroyed");
        isRunning = false;
    }

    public void drawData() {

        c = holder.lockCanvas();//锁定画布，一般在锁定后就可以通过其返回的画布对象Canvas，在其上面画图等操作了。
        oldT = System.currentTimeMillis();    //记录时间
        c.drawColor(Color.WHITE);//设置画布背景颜色
        for (int i = 0; i < 9; i++) {   //画横线
            c.drawLine(1, (int) (mapH / 8.0 * i) - 1, mapW - 1, (int) (mapH / 8.0 * i) - 1, pNet);
        }

        drawChannelTimeDomainData(dataIntDraw, dataHead, mapH - 1);

        c.drawText("帧数： " + String.valueOf(1000 / (System.currentTimeMillis() - oldT)), 50, 50, pText);
        holder.unlockCanvasAndPost(c);//结束锁定画图，并提交改变。
    }

    private void drawChannelTimeDomainData(int[] dataInt, int dataHead, int offSet) {
        oldX = 0;
        oldY = (int) (mapH - dataInt[dataHead] * kY + dY + offSet);
        for (int j = dataHead + 1; j < DataLength; j++) {
            c.drawLine(oldX, oldY, (int) (unitX * (j - dataHead)), (int) (mapH - dataInt[j] * kY + dY + offSet), pData);
            oldX = (int) (unitX * (j - dataHead));
            oldY = (int) (mapH - dataInt[j] * kY + dY + offSet);
        }
        for (int j = 0; j < dataHead; j++) {
            c.drawLine(oldX, oldY, (int) (unitX * (j + DataLength - dataHead)), (int) (mapH - dataInt[j] * kY + dY + offSet), pData);
            oldX = (int) (unitX * (j + DataLength - dataHead));
            oldY = (int) (mapH - dataInt[j] * kY + dY + offSet);
        }
    }

    private void drawChannelFrequencyData(float[] fftFloat, int offSet) {
        oldX = 0;
        oldY = (int) (mapH - fftFloat[0] * kY + dY + offSet);
        for (int j = 0; j < DataLength / 2; j++) {
            c.drawLine(oldX, oldY, (int) (unitX * j * 2), (int) (mapH - fftFloat[j] * kY + dY + offSet), pData);
            oldX = (int) (unitX * j * 2);
            oldY = (int) (mapH - fftFloat[j] * kY + dY + offSet);
        }
    }

    private boolean isDouble = false;
    private double oldTouchX, oldTouchY, oldDistanceX, oldDistanceY, nowDistanceX, nowDistanceY, dDistanceX, dDistanceY;    //记录第一次按下的坐标

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        switch (event.getAction() & MotionEvent.ACTION_MASK) {
            case MotionEvent.ACTION_DOWN:
                // 第一个手指按下事件
//                System.out.println("第一个手指按下事件");
                isDouble = false;
                oldTouchX = event.getX();
                oldTouchY = event.getY();
                break;
            case MotionEvent.ACTION_POINTER_DOWN:
                // 第二个手指按下事件
//                System.out.println("第二个手指按下事件");
                oldDistanceX = Math.abs(event.getX(1) - event.getX(0));
                oldDistanceY = Math.abs(event.getY(1) - event.getY(0));
                isDouble = true;
                break;
            case MotionEvent.ACTION_UP:
                isDouble = false;
                break;
            case MotionEvent.ACTION_POINTER_UP:
                // 手指放开事件
//                System.out.println("手指放开事件");
                isDouble = false;
                break;
            case MotionEvent.ACTION_MOVE:
                // 手指滑动事件
                if (isDouble) {  //2点缩放改变kY
                    nowDistanceX = Math.abs(event.getX(1) - event.getX(0));
                    nowDistanceY = Math.abs(event.getY(1) - event.getY(0));
                    dDistanceX = nowDistanceX - oldDistanceX;
                    dDistanceY = nowDistanceY - oldDistanceY;
                    if (Math.abs(dDistanceX) > 10 && Math.abs(dDistanceY) < 100) {  //X轴缩放

                    } else if (Math.abs(dDistanceX) < 100 && Math.abs(dDistanceY) > 10) {  //Y轴缩放
                        if (dDistanceY > 0 && kY < MAX_KY) {
                            kY = (float) (kY * 1.05);
                            KdY = (float) (KdY * 1.05);
                        } else if (dDistanceY < 0 && kY > MIN_KY) {
                            kY = (float) (kY * 0.95);
                            KdY = (float) (KdY * 0.95);
                        }
                    }
                } else {        //1点拖动改变 dY dX
                    if (Math.abs(dY) < mapH * outTime) {  //限定区域
                        dY = dY + (int) ((event.getY() - oldTouchY) * KdY);
                    }
                    if (signX <= mapW && signX >= 0) {  //限定区域
                        signX = signX + (int) ((event.getX() - oldTouchX) * 0.01f);
                        if (signX < 0) signX = 0;
                        if (signX > mapW) signX = mapW;
                    }
//                    System.out.println(String.valueOf(signX));
                }
                break;
        }
        return true;
    }


    @Override
    public void run() {
        while (isRunning) {
            //Log.d("Thred:", "running");
            try {
                drawData();
                Thread.sleep(20); // 这个就相当于帧频了，数值越小画面就越流畅
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //数据接收站
    public Handler dataHandler = new Handler() {
        public int data;

        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case BLEControl.BLE_MESSAGE:
                    try {
                        int data0 = (int) msg.obj;
                        dataHead = ++dataHead % DataLength;
                        dataInt0[dataHead] = data0;    //添加原始数据到原始数据数组

//                        int data_new0 = filterForEcg0(dataInt0, dataHead, DataLength);    //进行第一次滤波
//                        dataInt1[dataHead] = data_new0;    //更新数值
//                        int data_new1 = filterForEcg1(dataInt1, dataHead, DataLength);    //进行第一次滤波
//                        dataIntDraw[dataHead] = data_new1;    //更新数值
                        dataIntDraw[dataHead] = data0;    //更新数值
                    } catch (Exception e) {
                        Log.e("DataPaseError:", e.toString());
                    }
                    break;
            }
        }
    };
}