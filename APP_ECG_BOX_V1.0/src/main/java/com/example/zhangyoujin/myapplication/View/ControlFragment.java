package com.example.zhangyoujin.myapplication.View;

import android.app.Activity;
import android.app.Fragment;
import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;

import com.example.zhangyoujin.myapplication.BLE_PACKAGE.BLEControl;
import com.example.zhangyoujin.myapplication.BLE_PACKAGE.LeDeviceListAdapter;
import com.example.zhangyoujin.myapplication.R;

/**
 * Created by zhangyoujin on 15/9/7.
 */
public class ControlFragment extends Fragment {

    private final static String TAG = ControlFragment.class.getSimpleName();

    private Context mContext;

    private ListView lv_devices;
    BLEControl bleControl = null;


    public ControlFragment() {
    }

//    private Handler handler = new Handler(){
//        @Override
//        public void handleMessage(Message msg) {
//            // TODO Auto-generated method stub
//            super.handleMessage(msg);
//            switch (msg.what) {
//                case 0:
//                    break;
//                case 1:
//
//                    break;
//            }
//        }
//    };

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_decicelist, container, false);


        lv_devices = (ListView)rootView.findViewById(R.id.listView_devices);
        mContext = getActivity();
        bleControl = new BLEControl(mContext);
        bleControl.initLeDevice();
        bleControl.scanLeDevice(true);

        /************************* device 列表 **************************/
        lv_devices.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
                final BluetoothDevice device = bleControl.mLeDeviceListAdapter.getDevice(arg2);
                if (device == null) return;
                if (bleControl.mScanning) {
                    bleControl.mBluetoothAdapter.cancelDiscovery();
                    bleControl.mScanning = false;
                }
                bleControl.mBLE.connect(device.getAddress());
            }
        });

        return rootView;
    }

    @Override
    public void onResume() {
        super.onResume();
    }

    @Override
    public void onStart() {
        super.onStart();
        // Initializes list view adapter.
        bleControl.mLeDeviceListAdapter = new LeDeviceListAdapter((Activity) mContext);
        lv_devices.setAdapter(bleControl.mLeDeviceListAdapter);

    }

    @Override
    public void onStop() {
        super.onStop();
        bleControl.mLeDeviceListAdapter.clear();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        bleControl.closeLEDevice();
    }

    private int ByteArray2Int(byte[] data) {
        int resInt = 0;
        byte bLoop;

        for (int i = 0; i < data.length; i++) {
            bLoop = data[i];
            resInt += (bLoop & 0xFF) << (8 * i);
        }
        return resInt;
    }
}