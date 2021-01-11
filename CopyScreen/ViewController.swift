
import UIKit
import CoreGraphics

class ViewController: UIViewController {
    
    let favoritesImageView = UIImageView()
    let arrowImageView = UIImageView()
    let foodInfoView = FoodInfoView()
    let vegLabel = UILabel()
    let vegSwitch = UISwitch()
    let lineView = UIView()
    let tableView = UITableView()
    let headerImageView = UIImageView()
    
    let padding: CGFloat = 20
    
    var foodGroup:[Food] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UIImageView.appearance().tintColor = .systemBackground
        configureHeaderImageView()
        configureFavoritesImageView()
        configureArrowImageView()
        configureFoodInfoView()
        configureVegUI()
        configureLineView()
        configureTableView()
        configureDataSource()
    }
    
    
    func configureDataSource() {
        foodGroup.append(Food(foodName: "Chicken Keema", foodPrice: 60.00, foodImage: Images.hamburger1))
        foodGroup.append(Food(foodName: "Udta Punjab 2.0 Burger", foodPrice: 69.00, foodImage: Images.hamburger2))
        foodGroup.append(Food(foodName: "Amritsari Murgh Makhani", foodPrice: 79.00, foodImage: Images.hamburger3))
        foodGroup.append(Food(foodName: "American Grilled", foodPrice: 79.00, foodImage: Images.hamburger4))
    }
    
    private func configureHeaderImageView() {

        view.addSubview(headerImageView)
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImageView.heightAnchor.constraint(equalTo: headerImageView.widthAnchor, multiplier: 2/3)
        ])
        
        headerImageView.image = Images.headerImage
        headerImageView.contentMode = .scaleAspectFill
        createGradientLayer(with: headerImageView)
    }
    
    func createGradientLayer(with imageView:UIImageView){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: view.bounds.width * 2/3 * 1/2, width: view.bounds.width, height: view.bounds.width * 2/3 * 1/2)
        gradientLayer.colors = [UIColor.white.withAlphaComponent(0).cgColor, UIColor.white.withAlphaComponent(1).cgColor]
        imageView.layer.addSublayer(gradientLayer)
    }
    
    private func configureFavoritesImageView() {
        view.addSubview(favoritesImageView)
        favoritesImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritesImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            favoritesImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 37),
            favoritesImageView.widthAnchor.constraint(equalToConstant: 23),
            favoritesImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        favoritesImageView.image = Images.favorites
        favoritesImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        favoritesImageView.contentMode = .scaleAspectFill
    }
    
    private func configureArrowImageView() {
        view.addSubview(arrowImageView)
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrowImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            arrowImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            arrowImageView.widthAnchor.constraint(equalToConstant: 20.53),
            arrowImageView.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        arrowImageView.image = Images.arrowBackward
        arrowImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        arrowImageView.contentMode = .scaleAspectFill
    }
    
    private func configureFoodInfoView() {
        view.addSubview(foodInfoView)
        foodInfoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 116),
            foodInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            foodInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            foodInfoView.heightAnchor.constraint(equalTo: foodInfoView.widthAnchor, multiplier: 0.53)
        ])
        
        foodInfoView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        foodInfoView.layer.cornerRadius = 20
        foodInfoView.layer.shadowOpacity = 0.5
        foodInfoView.layer.shadowOffset = CGSize(width: 0, height: 2)
        foodInfoView.layer.shadowColor = UIColor.systemGray4.cgColor
    }
    
    private func configureVegUI() {
        view.addSubview(vegLabel)
        view.addSubview(vegSwitch)
        vegLabel.translatesAutoresizingMaskIntoConstraints = false
        vegSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vegLabel.topAnchor.constraint(equalTo: foodInfoView.bottomAnchor, constant: 25),
            vegLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            vegLabel.heightAnchor.constraint(equalToConstant: 24),
            
            vegSwitch.topAnchor.constraint(equalTo: vegLabel.topAnchor),
            vegSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(padding + 13)),
        ])
        
        vegLabel.text = "Veg only"
        vegLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        vegSwitch.subviews[0].subviews[0].backgroundColor = UIColor.systemBackground
        vegSwitch.layer.cornerRadius = vegSwitch.frame.height / 2
        vegSwitch.layer.borderWidth = 2
        vegSwitch.layer.borderColor = UIColor.systemGray5.cgColor
        
        // 縮放 switch 大小
//        vegSwitch.transform = CGAffineTransform(scaleX: 1, y: 1)

    }
    
    private func configureLineView() {
        view.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: vegLabel.bottomAnchor, constant: 18.52),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        lineView.backgroundColor = .systemGray5
        lineView.layer.cornerRadius = 1
    }
    

    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: padding),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        //一定要算準行高
        tableView.rowHeight = 110
        
        tableView.register(FoodCell.self, forCellReuseIdentifier: FoodCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.alwaysBounceVertical = false
        tableView.separatorStyle = .none
        
    }
    
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodCell.reuseId, for: indexPath) as! FoodCell
        let food = foodGroup[indexPath.row]
        cell.set(food: food)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 34))
        header.backgroundColor = .systemBackground
        let titleLabel = UILabel()
        
        header.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: padding),
            titleLabel.topAnchor.constraint(equalTo: header.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -10),
            titleLabel.trailingAnchor.constraint(equalTo: header.trailingAnchor)
        ])
        
        titleLabel.text = "Picked for you"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //建立 加到最愛 選項
        let addFavorites = UIContextualAction(style: .normal, title: "加到最愛") { (action, view, completionHandler) in
            
            let controller = UIAlertController(title: "已加到最愛", message: nil, preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Ok", style: .default))
            DispatchQueue.main.async {
                self.present(controller, animated: true)
            }
            
        }
        
        //建立 刪除 選項
        let deleteRow = UIContextualAction(style: .destructive, title: "刪除") { (action, view, completionHandler) in
            
            self.foodGroup.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            completionHandler(true)
        }
        
        //初始化 UISwipeActionsConfiguration 並回傳
        return UISwipeActionsConfiguration(actions: [addFavorites, deleteRow])
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        guard editingStyle == .delete else { return }
//        self.foodGroup.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .left)
//    }
    

}
