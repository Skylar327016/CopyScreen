import UIKit

class DemoViewController: UIViewController {
    
    //初始化元件
    let arrowImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureArrowImageView()
    }
    
    private func configureArrowImageView() {
        // storyboard 拉線
        view.addSubview(arrowImageView)
        
        // 設定  false 代表要使用 Auto Layout
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //設定 Auto Layout
        NSLayoutConstraint.activate([
            arrowImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            arrowImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            arrowImageView.widthAnchor.constraint(equalToConstant: 20.53),
            arrowImageView.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        //元件屬性設定
        arrowImageView.image = UIImage(systemName: "arrow.backward")
        arrowImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        arrowImageView.contentMode = .scaleAspectFill
    }

}
