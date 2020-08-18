//
//  vtcpay.swift
//  react_native_vtcpay
//
//  Created by LE THAI LOC on 8/17/20.
//


import Foundation

@objc(VTCPay)
class VTCPay: NSObject,VTCPaySDKWapManagerPaymentDelegate {
  
  private var callBackFinish:RCTResponseSenderBlock?;
  
  @objc(paymentAction:accountName:secrectKey:paymentType:amount:receiverAccount:orderCode:callback:)
  func paymentAction(appid: Int, accountName: String, secrectKey: String, paymentType: Int,amount: Int,receiverAccount:String,orderCode:String,callback: @escaping RCTResponseSenderBlock) -> Void {
    
    VTCPaySDKWapManager.shared()?.isSandbox = true;//is Development
    
    var paymentTypeData: VTCPaySDKWapManager.PaymentType = VTCPaySDKWapManager.PaymentType.vtcWallet;
    switch (paymentType) {
        case 0:
            paymentTypeData = VTCPaySDKWapManager.PaymentType.vtcWallet;
            break;
        case 1:
            paymentTypeData = VTCPaySDKWapManager.PaymentType.visaMasterCard;
            break;
        case 2:
            paymentTypeData = VTCPaySDKWapManager.PaymentType.domesticCard;
            break;
        case 3:
          paymentTypeData = VTCPaySDKWapManager.PaymentType.attachedCard
            break;
            
        default:
            break;
    }
    
    VTCPaySDKWapManager.shared()?.settingMerchain(appId: appid, accountName: accountName, secrectKey: secrectKey)
    VTCPaySDKWapManager.shared()?.paymentDelegate = self;
    callBackFinish = callback;
    VTCPaySDKWapManager.shared()?.makePayment(amount: amount, receiverAccount: receiverAccount, orderCode: orderCode, paymentType: paymentTypeData, language: VTCPaySDKWapManager.LanguageType.vtcPayLangVienamese)
 
  }
  
//  @objc
//  func login() {
//    VTCPaySDKWapManager.shared()?.login();
//  }
//
//
//  @objc
//  func showHome() {
//    VTCPaySDKWapManager.shared()?.showHome();
//  }
//
//  @objc
//  func getAssociationResponse(_ callback: RCTResponseSenderBlock) {
//    callback([VTCPaySDKWapManager.shared()?.getAssociationResponse()])
//  }
//
//  @objc
//  func topup() {
//    VTCPaySDKWapManager.shared()?.topup();
//  }
  
  
  func VTCPaySDKPaymentDidFinished(success: Bool, errorMessage: String!, amount: Int, transactionId: Int, status: Int, orderId: Int, paymentType: String!, orderCode: String!) {
    callBackFinish!([success,errorMessage])
  }
  
}

