import Foundation

func saveUserData(value : Any?, key : String) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()

}

