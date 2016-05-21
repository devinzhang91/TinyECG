package com.example.zhangyoujin.myapplication.BLE_PACKAGE;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.widget.Toast;

import com.example.zhangyoujin.myapplication.R;
import com.example.zhangyoujin.myapplication.View.BleMsgFragment;
import com.example.zhangyoujin.myapplication.View.MainActivity;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by zhangyoujin on 16/4/2.
 */
public class BLEControl {

    private final static String TAG = BLEControl.class.getSimpleName();
    public final static String UUID_KEY_DATA_SERVER = "0000ffe0-0000-1000-8000-00805f9b34fb";
    public final static String UUID_KEY_DATA_R = "0000ffe4-0000-1000-8000-00805f9b34fb";
    public final static String UUID_KEY_DATA_T = "0000ffe9-0000-1000-8000-00805f9b34fb";
    public static final int BLE_STATE = 8000;
    public static final int BLE_MESSAGE = 8001;
    public static final int BLE_CONNECT = 8800;
    public static final int BLE_DISCONNECT = 8801;
    private static final long SCAN_PERIOD = 20000;

    private Context mContext;
    private BluetoothReceiver receiver;
    public ArrayList<BluetoothDevice> mLeDevices = new ArrayList<>();
    public ArrayList<BluetoothLeClass> mBLEs = new ArrayList<>();
    public BluetoothAdapter mBluetoothAdapter; //蓝牙适配器
    public LeDeviceListAdapter mLeDeviceListAdapter; //蓝牙列表适配器
    public BluetoothLeClass mBLE;  //BLE通信类
    public boolean mScanning;
    public Handler mHandler;

    public BLEControl(Context mContext) {
        this.mContext = mContext;
    }

    //初始化BLE
    public void initLeDevice() {

        IntentFilter filter = new IntentFilter(BluetoothDevice.ACTION_FOUND);
        receiver = new BluetoothReceiver();
        mContext.registerReceiver(receiver, filter);
        mHandler = new Handler();
        if (!mContext.getPackageManager().hasSystemFeature(PackageManager.FEATURE_BLUETOOTH_LE)) {
            Toast.makeText(mContext, R.string.ble_not_supported, Toast.LENGTH_SHORT).show();
        }
        final BluetoothManager bluetoothManager =
                (BluetoothManager) mContext.getSystemService(Context.BLUETOOTH_SERVICE);
        mBluetoothAdapter = bluetoothManager.getAdapter();

        // Checks if Bluetooth is supported on the device.
        if (mBluetoothAdapter == null) {
            Toast.makeText(mContext, R.string.error_bluetooth_not_supported, Toast.LENGTH_SHORT).show();
            return;
        }
        //开启蓝牙
        mBluetoothAdapter.enable();

        mBLE = new BluetoothLeClass(mContext);
        if (!mBLE.initialize()) {
            Log.e(TAG, "Unable to initialize Bluetooth");
        }
        //发现BLE终端的Service时回调
        mBLE.setOnServiceDiscoverListener(mOnServiceDiscover);
        //收到BLE终端数据交互的事件
        mBLE.setOnDataAvailableListener(mOnDataAvailable);
        mBLE.setOnConnectListener(mOnConnect);
        mBLE.setOnDisconnectListener(mOnDisconnect);
    }

    public void scanLeDevice(final boolean enable) {
        if (enable) {
            mHandler.postDelayed(new Runnable() {
                @Override
                public void run() {
                    mScanning = false;
                    mBluetoothAdapter.cancelDiscovery();
                }
            }, SCAN_PERIOD);

            mScanning = true;
            mBluetoothAdapter.startDiscovery();
        } else {
            mScanning = false;
            mBluetoothAdapter.cancelDiscovery();
        }
    }

    public void closeLEDevice() {
        mBluetoothAdapter.cancelDiscovery();
        mBLE.disconnect();
        mBLE.close();
    }

    public void sendMessage(String message) {
        for (BluetoothGattService gattService : mBLE.getSupportedGattServices()) {
            List<BluetoothGattCharacteristic> gattCharacteristics = gattService.getCharacteristics();
            for (final BluetoothGattCharacteristic gattCharacteristic : gattCharacteristics) {
                if (gattCharacteristic.getUuid().toString().equals(UUID_KEY_DATA_T)) {
                    //设置数据内容
                    gattCharacteristic.setValue(message);
                    //往蓝牙模块写入数据
                    mBLE.writeCharacteristic(gattCharacteristic);
                }
            }
        }
    }

    //接收蓝牙设备广播
    private class BluetoothReceiver extends BroadcastReceiver {     //发现蓝牙设备
        @Override
        public void onReceive(Context context, Intent intent) {
            Log.e("TAG", "onReceive");
            String action = intent.getAction();
            if (BluetoothDevice.ACTION_FOUND.equals(action)) {
                BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                mLeDevices.add(device); //加入设备列表
                mLeDeviceListAdapter.addDevice(device);
                mLeDeviceListAdapter.notifyDataSetChanged();
                //Toast.makeText(mContext, "Found : " + device.getAddress().toString(), Toast.LENGTH_SHORT).show();
            }
        }
    }

    //搜索到BLE终端服务的事件
    private BluetoothLeClass.OnServiceDiscoverListener mOnServiceDiscover = new BluetoothLeClass.OnServiceDiscoverListener() {

        @Override
        public void onServiceDiscover(BluetoothGatt gatt) {
            //成功链接上BLE设备
            //setGattServices(mBLE.getSupportedGattServices());
            mBLE.setCharacteristicNotification(gatt                         //设置透传
                            .getService(UUID.fromString(UUID_KEY_DATA_SERVER))
                            .getCharacteristic(UUID.fromString(UUID_KEY_DATA_R)),
                    true);

        }
    };


    //收到BLE终端数据交互的事件
    private BluetoothLeClass.OnDataAvailableListener mOnDataAvailable = new BluetoothLeClass.OnDataAvailableListener() {

        //BLE终端数据被读的事件
        @Override
        public void onCharacteristicRead(BluetoothGatt gatt, final BluetoothGattCharacteristic characteristic, int status) {
            if (status == BluetoothGatt.GATT_SUCCESS) {
                Log.i(TAG, "onCharRead " + characteristic.getUuid().toString());
            }
        }

        //收到BLE终端写入数据回调
        @Override
        public void onCharacteristicWrite(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic) {
            //Log.i(TAG, "onCharWirte " + gatt.getDevice().getName());

            byte[] data_temp = characteristic.getValue();
            for (int i = 0; i < 4; i++) {
                int data0H = (data_temp[i * 4 + 0]&0xFF)*256;
                int data0L = (data_temp[i * 4 + 1]&0xFF);
                int data1H = (data_temp[i * 4 + 2]&0xFF)*256;
                int data1L = (data_temp[i * 4 + 3]&0xFF);

                int data0 = data0H + data0L;
                int data1 = data1H + data1L;

                Message message0 = new Message(), message1 = new Message();
                message0.what = BLE_MESSAGE;
                message1.what = BLE_MESSAGE;

                message0.obj = data0;
                MainActivity.dataMap0.dataHandler.sendMessage(message0);
                message1.obj = data1;
                MainActivity.dataMap1.dataHandler.sendMessage(message1);
            }
            int dataTempH = (data_temp[16]&0xFF)*256;
            int dataTempL = (data_temp[17]&0xFF);
            int data0 = dataTempH + dataTempL;
            Message messageTemp = new Message();
            messageTemp.what = BLE_MESSAGE;
            messageTemp.obj = data0;
            BleMsgFragment.dataHandler.sendMessage(messageTemp);

        }
    };

    //BLE连接事件
    private BluetoothLeClass.OnConnectListener mOnConnect = new BluetoothLeClass.OnConnectListener() {

        @Override
        public void onConnect(BluetoothGatt gatt) {
            //Toast.makeText(mContext, R.string.connected, Toast.LENGTH_SHORT).show();
//            Message message = new Message();
//            message.what = BLE_STATE;
//            message.obj = BLE_CONNECT;
//            MainActivity.mainUIHandler.sendMessage(message);
        }
    };

    //BLE断开事件
    private BluetoothLeClass.OnDisconnectListener mOnDisconnect = new BluetoothLeClass.OnDisconnectListener() {

        @Override
        public void onDisconnect(BluetoothGatt gatt) {
            //Toast.makeText(mContext, R.string.disconnected, Toast.LENGTH_SHORT).show();
//            Message message = new Message();
//            message.what = BLE_STATE;
//            message.obj = BLE_DISCONNECT;
//            MainActivity.mainUIHandler.sendMessage(message);
        }
    };

    private void setGattServices(List<BluetoothGattService> gattServices) {
        if (gattServices == null) return;

        for (BluetoothGattService gattService : gattServices) {
            if (gattService.getUuid().toString().equals(UUID_KEY_DATA_SERVER)) {  //DATA SERVER
                List<BluetoothGattCharacteristic> gattCharacteristics = gattService.getCharacteristics();
                for (final BluetoothGattCharacteristic gattCharacteristic : gattCharacteristics) {
                    if (gattCharacteristic.getUuid().toString().equals(UUID_KEY_DATA_R)) {    //设置透传消息Notif
                        mBLE.setCharacteristicNotification(gattCharacteristic, true);
                    }
                }
            }
        }
    }
}
