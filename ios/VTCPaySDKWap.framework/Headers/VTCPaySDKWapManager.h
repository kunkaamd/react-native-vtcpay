//
//  VTCPaySDKWapManager.h
//  VTCPaySDKWap
//
//  Created by Admin on 9/26/18.
//  Copyright © 2018 Nguyen Huy Quang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// Payment type
typedef NS_ENUM(NSInteger, VTCPaySDKWapPaymentType)
{
    /// Using payment with balance of user's VTC Wallet
    VTCPaySDKWapPaymentTypeVTCWallet NS_SWIFT_NAME(vtcWallet) = 1,
    /// Using payment with domestic bank card
    VTCPaySDKWapPaymentTypeDomesticCard NS_SWIFT_NAME(domesticCard) = 2,
    /// Using payment with Visa Master card
    VTCPaySDKWapPaymentTypeVisaMasterCard NS_SWIFT_NAME(visaMasterCard) = 3,
    /// Using payment with user's attached card
    VTCPaySDKWapPaymentTypeAttachedCard NS_SWIFT_NAME(attachedCard) = 4
} NS_SWIFT_NAME(VTCPaySDKWapManager.PaymentType);

/// Payment language type
typedef NS_ENUM(NSInteger, VTCPaySDKWapLanguageType) {
    /// Vietnamese
    VTCPaySDKWapLanguageTypeVietnamese NS_SWIFT_NAME(vtcPayLangVienamese) = 0,
    /// English
    VTCPaySDKWapLanguageTypeEnglish NS_SWIFT_NAME(vtcPayLangEnglish) = 1
} NS_SWIFT_NAME(VTCPaySDKWapManager.LanguageType);

@protocol VTCPaySDKWapManagerPaymentDelegate <NSObject>
@required
/// This function will be called after payment finished. you have to check success and status value
- (void) VTCPaySDKPaymentDidFinished:(BOOL)success errorMessage:(NSString *) errorMessage amount:(NSInteger) amount transactionId:(NSInteger)transactionId status:(NSInteger)status orderId:(NSInteger)orderId paymentType:(NSString *)paymentType orderCode:(NSString *)orderCode NS_SWIFT_NAME(VTCPaySDKPaymentDidFinished(success:errorMessage:amount:transactionId:status:orderId:paymentType:orderCode:));
@end

@interface VTCPaySDKWapManager : NSObject

@property (weak, nonatomic) id<VTCPaySDKWapManagerPaymentDelegate> paymentDelegate;
@property (assign, nonatomic) BOOL isSandbox;
@property (assign, nonatomic) BOOL isBeta;
@property (strong, nonatomic) NSString * urlCallback;

+ (instancetype) sharedManager NS_SWIFT_NAME(shared());

- (void) settingMerchainWithAppId:(NSInteger)appId accountName:(NSString *)accountName secrectKey:(NSString *)secrectKey NS_SWIFT_NAME(settingMerchain(appId:accountName:secrectKey:));
- (void) showHomeSDK NS_SWIFT_NAME(showHome());
- (void) login NS_SWIFT_NAME(login());
- (void) topup NS_SWIFT_NAME(topup());
- (void) paymentWithAmount:(NSInteger) amount receiverAccount:(NSString *)receiverAccount orderCode:(NSString *)orderCode paymentType:(VTCPaySDKWapPaymentType)paymentType language:(VTCPaySDKWapLanguageType)language NS_SWIFT_NAME(makePayment(amount:receiverAccount:orderCode:paymentType:language:));
- (NSString *) getAssociationResponse NS_SWIFT_NAME(getAssociationResponse());
@end

