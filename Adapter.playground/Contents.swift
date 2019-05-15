import UIKit

protocol CarProtocol {
    func startEngine()
    func stopEngine()
    func ride()
    func stop()
}

class Tesla: CarProtocol {
    func startEngine() {
        print("vruuummmm... vrum... vrum...")
    }
    
    func stopEngine() {
        print("brrrr....")
    }
    
    func ride() {
        print("car riding now...")
    }
    
    func stop() {
        print("car stop!")
    }
}

class Volga {
    func startVolgaEngine() {
        print("Volga vruuummmm... vrum... vrum...")
    }
    
    func stopVolgaEngine() {
        print("Volga brrrr....")
    }
    
    func rideVolga() {
        print("Volga car riding now...")
    }
    
    func stopVolga() {
        print("Volga car stop!")
    }
}

class VolgaAdapter: CarProtocol {
    private let volga: Volga
    
    init(volga: Volga) {
        self.volga = volga
    }
    
    func startEngine() {
        self.volga.startVolgaEngine()
    }
    
    func stopEngine() {
        self.volga.stopVolgaEngine()
    }
    
    func ride() {
        self.volga.rideVolga()
    }
    
    func stop() {
        self.volga.stopVolga()
    }
}

func testCar(car: CarProtocol) {
    car.startEngine()
    car.ride()
    car.stop()
    car.stopEngine()
}

let newTesla = Tesla()
testCar(car: newTesla)
let volga = Volga()
let newVolga = VolgaAdapter.init(volga: volga)
testCar(car: newVolga)
