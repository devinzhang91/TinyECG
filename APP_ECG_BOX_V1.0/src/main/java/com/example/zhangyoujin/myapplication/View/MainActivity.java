package com.example.zhangyoujin.myapplication.View;

import android.app.Activity;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;

import com.example.zhangyoujin.myapplication.BLE_PACKAGE.BLEControl;
import com.example.zhangyoujin.myapplication.R;

public class MainActivity extends Activity {

    //视图参数参数
    public static int SCREEN_WIDTH;
    public static int SCREEN_HEIGHT;
    LinearLayout linearLayout;
    private SurfaceHolder sfh;   //surfaceView的 控制器
    public static DrawData dataMap0;
    public static DrawData dataMap1;
    static FragmentManager fm;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);requestWindowFeature(Window.FEATURE_NO_TITLE);    //隐藏标题
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);   //设置全屏
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        setContentView(R.layout.activity_main);
        DisplayMetrics dm = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(dm);
        SCREEN_WIDTH = dm.widthPixels;
        SCREEN_HEIGHT = dm.heightPixels;

        linearLayout = (LinearLayout)findViewById(R.id.main_linear_view);
        fm = getFragmentManager();

        addOscilloscopeFragment();
//        LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(SCREEN_WIDTH, SCREEN_HEIGHT);
//        linearLayout.setLayoutParams(p);
        setControlFragment();
        setBleMsgFragment();
    }

    private static void setBleMsgFragment() {
        FragmentTransaction transaction = fm.beginTransaction();
        BleMsgFragment controlView = new BleMsgFragment();
        transaction.replace(R.id.fragment0, controlView);
        transaction.commit();
    }

    private static void setControlFragment() {
        FragmentTransaction transaction = fm.beginTransaction();
        ControlFragment controlView = new ControlFragment();
        transaction.replace(R.id.fragment1, controlView);
        transaction.commit();
    }

    private void addOscilloscopeFragment() {
        dataMap0 = new DrawData(getApplicationContext());
        linearLayout.addView(dataMap0);

        dataMap1 = new DrawData(getApplicationContext());
        linearLayout.addView(dataMap1);
    }


    //消息接收站
    public static Handler mainUIHandler = new Handler() {
        public int data;

        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case BLEControl.BLE_STATE:
                    try {
                        int bleStateNum = (int) msg.obj;
                        switch (bleStateNum) {
                            case BLEControl.BLE_CONNECT :       //connect and change ui 2 blemsg
                                setBleMsgFragment();
                                break;
                            case BLEControl.BLE_DISCONNECT :    //disconnect and change ui 2 scanlist
                                setControlFragment();
                                break;
                        }
                    } catch (Exception e) {
                        Log.e("DataPaseError:", e.toString());
                    }
                    break;
            }
        }
    };
}
