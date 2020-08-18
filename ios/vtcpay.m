//
//  vtcpay.m
//  react_native_vtcpay
//
//  Created by SOFTONE on 8/17/20.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(VTCPay, NSObject)

RCT_EXTERN_METHOD(paymentAction:(nonnull NSNumber *)appid accountName:(nonnull NSString *)accountName secrectKey:(nonnull NSString *)secrectKey paymentType:(nonnull NSNumber *)paymentType amount:(nonnull NSNumber *)amount receiverAccount:(nonnull NSString *)receiverAccount orderCode:(nonnull NSString *)orderCode callback: (RCTResponseSenderBlock)callback)

//RCT_EXTERN_METHOD(login)
//RCT_EXTERN_METHOD(showHome)
//RCT_EXTERN_METHOD(topup)
//RCT_EXTERN_METHOD(getAssociationResponse: (RCTResponseSenderBlock)callback)

@end
