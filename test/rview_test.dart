import 'package:flutter_test/flutter_test.dart';
import 'package:rview/src/rview.dart';
import 'package:rview/rview_platform_interface.dart';
import 'package:rview/rview_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRviewPlatform
    with MockPlatformInterfaceMixin
    implements RviewPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final RviewPlatform initialPlatform = RviewPlatform.instance;

  test('$MethodChannelRview is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRview>());
  });

  test('getPlatformVersion', () async {
    Rview rviewPlugin = Rview();
    MockRviewPlatform fakePlatform = MockRviewPlatform();
    RviewPlatform.instance = fakePlatform;

    expect(await rviewPlugin.getPlatformVersion(), '42');
  });
}
