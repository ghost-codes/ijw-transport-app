import 'package:equatable/equatable.dart';

class BranchData extends Equatable {
  final String? campaign;
  final String? feature;
  final String? channel;
  final bool isReferringLink;

  final Map<String, dynamic> rawData;

  /// referral data
  final String? affiliateId;
  final String? referrerId;

  /// this is the branch resolved url
  final String? referringLink;

  /// payroll data
  final String? partnerApp;
  final String? company;

  /// group invite data
  final String? groupAppId;
  final String? groupId;

  const BranchData({
    required this.isReferringLink,
    this.campaign,
    this.feature,
    this.referrerId,
    this.affiliateId,
    this.channel,
    this.referringLink,
    this.partnerApp,
    this.company,
    this.groupId,
    this.groupAppId,
    required this.rawData,
  });

  factory BranchData.fromParams(Map<String, dynamic> params) {
    final campaign = params['~campaign']?.toString();
    final referralLink = params['~referring_link']?.toString();
    final nonReferringLink = params['+non_branch_link']?.toString();
    var affiliateId = params['affiliate_id']?.toString();

    if (campaign == 'affiliate' && referralLink != null) {
      final queryParams = Uri.tryParse(referralLink)?.queryParameters ?? {};
      affiliateId ??= queryParams['id']?.toString();
    }

    return BranchData(
      rawData: params,
      isReferringLink: nonReferringLink == null,
      campaign: campaign,
      affiliateId: affiliateId,
      referringLink: referralLink ?? nonReferringLink,
      groupId: params['group_id']?.toString(),
      groupAppId: params['group_App_id']?.toString(),
      company: params['company']?.toString(),
      partnerApp: params['partner_app']?.toString(),
      referrerId: params['App_id']?.toString(),
      feature: params['~feature']?.toString(),
      channel: params['~channel']?.toString(),
    );
  }

  Map<String, dynamic> toMap() => {
        'company': company,
        'partnerApp': partnerApp,
        'referrerId': referrerId,
        'affiliateId': affiliateId,
        'channel': channel,
        'feature': feature,
        'campaign': campaign,
        'referringLink': referringLink,
        'is_branch_link': isReferringLink,
        'group_id': groupId,
        'group_App_id': groupAppId,
      };

  @override
  List<Object?> get props => [
        campaign,
        feature,
        referrerId,
        affiliateId,
        channel,
        partnerApp,
        company,
        groupId,
      ];
}
