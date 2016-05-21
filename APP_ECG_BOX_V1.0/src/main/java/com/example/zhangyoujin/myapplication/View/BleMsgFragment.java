package com.example.zhangyoujin.myapplication.View;

import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.example.zhangyoujin.myapplication.BLE_PACKAGE.BLEControl;
import com.example.zhangyoujin.myapplication.R;

/**
 * Created by zhangyoujin on 16/4/22.
 */
public class BleMsgFragment extends Fragment {

    private final static String TAG = ControlFragment.class.getSimpleName();
    static TextView tv_temp;
    private Context mContext;

    public BleMsgFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_blemsg, container, false);

        tv_temp = (TextView)rootView.findViewById(R.id.textView_temp);

        mContext = getActivity();

        return rootView;
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        tv_temp = null;
    }

    //数据接收站
    public static Handler dataHandler = new Handler() {

        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case BLEControl.BLE_MESSAGE:
                    try {
                        int data = (int) msg.obj;
                        if(tv_temp!=null) {
                            tv_temp.setText(String.valueOf(data));
                        }
                    } catch (Exception e) {
                        Log.e("DataPaseError:", e.toString());
                    }
                    break;
            }
        }
    };
}