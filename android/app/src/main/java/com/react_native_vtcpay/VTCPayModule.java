package com.react_native_vtcpay;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.vtc.sdkpay2.function.VTCPaySDK;
import com.vtc.sdkpay2.model.VTCAppInfoModel;

public class VTCPayModule extends ReactContextBaseJavaModule {
    private static ReactApplicationContext reactContext;

    VTCPayModule(ReactApplicationContext context) {
        super(context);
        reactContext = context;
    }

    @NonNull
    @Override
    public String getName() {
        return "VTCPay";
    }

    @ReactMethod
    public void paymentAction(int appid, String accountName, String secrectKey, int paymentType, int amount, String receiverAccount, String orderCode, Callback callback) {
        VTCAppInfoModel appInfoModel = new VTCAppInfoModel(Integer.toString(appid),accountName,secrectKey);
        appInfoModel.setAmount((double) amount);
        appInfoModel.setOrderCode(orderCode);
        appInfoModel.setCurrency(VTCPaySDK.VND);
        appInfoModel.setReceiverAccount(receiverAccount);
        appInfoModel.setPaymentType(paymentType);
        VTCPaySDK.getInstance().nextFunctionVTCPay(getCurrentActivity(), VTCPaySDK.PAYMENT, appInfoModel, (responseCode, Description) -> {
            callback.invoke(responseCode,Description);
        });

        System.out.println("hello con be");
    }
}
