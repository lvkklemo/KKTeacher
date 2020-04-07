# iOS原生项目导入Flutter
> Flutter作为新一代的混合开发框架，凭借其优越的性能和简单的操作已逐渐进入广大移动端开发者视野，本文实现在的项目中加入Flutter模块

#### 1.`flutter`环境搭建

[官网下载地址](https://flutter.dev/docs/get-started/install/macos)

```
cd ~/development
$ unzip ~/Downloads/flutter_macos_v1.5.4-hotfix.2-stable.zi
```

设置系统环境变量,添加flutter命令

```
// 1. 在终端输入
sudo vim $HOME/.bash_profile
// 2. 添加如下命令，替换[PATH_TO_FLUTTER_GIT_DIRECTORY]为自己解压的flutter所在路径
export PATH=$PATH:/Users/yuhanglv/developer/flutter/bin
// 3. 执行如下命令，生效bash_profile
source $HOME/.bash_profile
```

创建项目

```
flutter doctor
flutter create my_app //创建项目
flutter create —template module my_app //创建模块
cd my_app   //进入项目目录
open -a Simulator    //打卡模拟器
flutter run  //运行项目
```

#### 2.创建文件夹`KKTeacher`

1.首先执行命令创建，flutter项目module

```
cd /Users/yuhanglv/Desktop/KKTeacher
flutter create -t module my_flutter
```

2.在`KKTeacher`目录下创建xcode原生项目,修改Podfile

```
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/baijia/specs.git'

platform :ios, "9.0"
inhibit_all_warnings!
use_frameworks!
flutter_application_path = '../my_flutter'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target "kk_teacher" do
  install_all_flutter_pods(flutter_application_path)
end
```

3.执行 `pod install`

#### 3.Xcode项目设置

AppDelegate

```objective-c
#import <Flutter/Flutter.h>
@interface AppDelegate : FlutterAppDelegate <UIApplicationDelegate>
@property(nonatomic,strong)FlutterEngine *flutterEngin;
@end
```

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.flutterEngin = [[FlutterEngine alloc] initWithName:@"io.flutter" project:nil];
    [self.flutterEngin runWithEntrypoint:nil];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
```

ios控制器跳转到flutter界面

```objective-c
FlutterViewController* fluttervc = [[FlutterViewController alloc] init];
[fluttervc setInitialRoute:@"helloPage"];
[self.navigationController pushViewController:fluttervc animated:YES];
```

