### swift 全局解决iOS13模态视图不全屏问题

* 创建一个基础控制器类

```swift
class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension BaseController {
    // 重写 当调用模态视图时，展示全屏
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        super .present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
}
```

* 其他所有控制器类都继承此基类，直接调用即可解决

```swift
self.present(BaseNavigationController(rootViewController: OtherController()), animated: true, completion: nil)
```


### swift 开发之震动反馈

```swift
 //建立的SystemSoundID对象,标准长震动
let soundID = SystemSoundID(kSystemSoundID_Vibrate)
        
//短振动，普通短震，3D Touch 中 Peek 震动反馈
let soundShort = SystemSoundID(1519)

//普通短震，3D Touch 中 Pop 震动反馈,home 键的振动
let soundMiddle = SystemSoundID(1520)

// 连续三次短震
let soundThere = SystemSoundID(1521)

//执行震动
AudioServicesPlaySystemSound(soundID)
        
```

### swift 设置全屏返回手势
```swift
// 在自定义的导航栏中，添加如下代码
// 设置全屏返回手势
guard  let targets = interactivePopGestureRecognizer?.value(forKey: "_targets") as?[AnyObject] else {
	 return
}
//拿到 action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7ff515c0dc80>

let dict = targets[0]
//拿到action
let target = dict.value(forKey: "target") as Any
//通过字典无法拿到action，这里通过Selector方法包装action
let action = Selector(("handleNavigationTransition:"))

//拿到target action 创建pan手势并添加到全屏view上
let gesture = UIPanGestureRecognizer(target: target, action: action)
view.addGestureRecognizer(gesture)
```