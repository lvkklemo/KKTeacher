# iOS原生项目导入Flutter
> Flutter作为新一代的混合开发框架，凭借其优越的性能和简单的操作已逐渐进入广大移动端开发者视野，本文实现在的项目中加入Flutter模块

#### 1.首先创建一个文件夹`KKTeacher`

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

