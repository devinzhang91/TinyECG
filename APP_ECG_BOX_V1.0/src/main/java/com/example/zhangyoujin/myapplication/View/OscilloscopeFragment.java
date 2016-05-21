package com.example.zhangyoujin.myapplication.View;

import android.app.Fragment;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

/**
 * Created by zhangyoujin on 15/9/15.
 */

public class OscilloscopeFragment extends Fragment {
    Handler handle;

    public OscilloscopeFragment(Handler mHandle) {
        this.handle = mHandle;
    }
    public OscilloscopeFragment() { }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        System.out.println("OscilloscopeFragment--->onCreateView");
        View rootView = new DrawData(getActivity());
        return rootView;
    }

    @Override
    public void onStart()
    {
        super.onStart();
    }
}