//
//  AppAssembly.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 21.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class ApplicationAssembly {
    
    // Use default dependency
    class var assembler: Assembler {
        return Assembler([
            TemplateAssemblyContainer(),
            RootAssemblyContainer(),
            AppAssemblyContainer(),
            SignInAssemblyContainer(),
            SignUpAssemblyContainer(),
            RemoteDataManagerAssemblyContainer(),
            ProfileAssemblyContainer(),
            ProfileEditAssemblyContainer(),
            NotificationSetupAssemblyContainer()
            ])
    }
    
    var assembler: Assembler
    
    // If you want use custom Assembler
    init(with assemblies: [Assembly]) {
        assembler = Assembler(assemblies)
    }
    
}

// Inject dependency in Root Storyboard
extension SwinjectStoryboard {    
    @objc public static func setup() {
        defaultContainer = ApplicationAssembly.assembler.resolver as! Container
        print(defaultContainer)
    }
    
}
