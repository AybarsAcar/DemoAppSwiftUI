//
//  LoginView.swift
//  DemoApp
//
//  Created by Aybars Acar on 20/4/2022.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
  
  @Environment(\.dismiss) private var dismiss
  @EnvironmentObject private var userStore: UserStore
  
  // hero animation states
  @State private var show = false
  @State private var viewState: CGSize = .zero
  @State private var isDragging = false
  
  // login form states
  @State private var email = ""
  @State private var password = ""
  
  // form focus field
  private enum Field: Hashable {
    case email, password
  }
  @FocusState private var focusedField: Field?
  
  @State private var showAlert = false
  @State private var alertMessage = ""
  
  @State private var isLoading = false
  
  @State private var success = false
  
  var body: some View {
    ZStack(alignment: .top) {
      Color.black
        .ignoresSafeArea()
      
      Color.theme.background2
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .edgesIgnoringSafeArea(.bottom)
      
      Group {
        heroSection
        
        formSection
        
      }
      .offset(y: focusedField != nil ? -100 : 0)
      .animation(.easeInOut, value: focusedField)
      
      HStack {
        Spacer()
        
        Image(systemName: "xmark")
          .font(.subheadline)
          .foregroundColor(.white)
          .padding()
          .background(.black)
          .clipShape(Circle())
          .onTapGesture {
            userStore.showLogin = false
            dismiss()
          }
      }
      .padding()
      
      buttonSection
      
      if isLoading {
        LoadingView()
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
      }
      
      if success {
        SuccessView()
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
      }

    }
    .onTapGesture {
      UIApplication.shared.endEditing()
    }
  }
}

// MARK: - Components
extension LoginView {
  
  private var heroSection: some View {
    VStack {
      
      Text("Learn design & code.\nFrom scratch.")
        .font(.largeTitle)
        .fontWeight(.semibold)
        .minimumScaleFactor(0.6)
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .frame(maxWidth: 375, maxHeight: 100)
        .padding(.horizontal, 16)
        .offset(x: viewState.width / 15, y: viewState.height / 15)
      
      Text("80 hours of courses for SwiftUI, React, and design tools")
        .font(.subheadline)
        .frame(width: 250)
        .multilineTextAlignment(.center)
        .offset(x: viewState.width / 20, y: viewState.height / 20)
      
      Spacer()
    }
    .padding(.top, 100)
    .frame(maxWidth: .infinity)
    .frame(height: 477)
    .background(
      ZStack {
        Image("Blob")
          .offset(x: -150, y: -200)
          .rotationEffect(.degrees(show ? 360 + 90 : 90))
          .blendMode(.plusDarker)
          .animation(.linear(duration: 120).repeatForever(autoreverses: false), value: show)
          .onAppear {
            show = true
          }
        
        Image("Blob")
          .offset(x: -200, y: -250)
          .rotationEffect(.degrees(show ? 360 : 0), anchor: .leading)
          .blendMode(.overlay)
          .animation(.linear(duration: 100).repeatForever(autoreverses: false), value: show)
        
      }
    )
    .background(
      Image("Card3")
        .offset(x: viewState.width / 25, y: viewState.height / 25)
      , alignment: .bottom
    )
    .background(Color.theme.loginBackground)
    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    .scaleEffect(isDragging ? 0.9 : 1)
    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: isDragging)
    .rotation3DEffect(.degrees(5), axis: (viewState.width, viewState.height, 0))
    .gesture(
      DragGesture()
        .onChanged { value in
          viewState = value.translation
          isDragging = true
        }
        .onEnded { value in
          viewState = .zero
          isDragging = false
        }
    )
  }
  
  private var formSection: some View {
    VStack {
      HStack {
        Image(systemName: "person.crop.circle.fill")
          .foregroundColor(.theme.loginBackground)
          .frame(width: 44, height: 44)
          .background(.white)
          .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
          .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 5)
        
        TextField("Your Email".uppercased(), text: $email)
          .keyboardType(.emailAddress)
          .font(.subheadline)
          .padding(.leading)
          .frame(height: 44)
          .focused($focusedField, equals: .email)
      }
      .padding(.leading)
      
      Divider()
        .padding(.horizontal, 80)
      
      HStack {
        Image(systemName: "lock.fill")
          .foregroundColor(.theme.loginBackground)
          .frame(width: 44, height: 44)
          .background(.white)
          .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
          .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 5)
        
        SecureField("Password".uppercased(), text: $password)
          .font(.subheadline)
          .padding(.leading)
          .frame(height: 44)
          .focused($focusedField, equals: .password)
        
      }
      .padding(.leading)
    }
    .frame(height: 136)
    .frame(maxWidth: .infinity)
    .background(BlurView(withStyle: .systemChromeMaterial))
    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    .shadow(color: .black.opacity(0.4), radius: 20, x: 0, y: 20)
    .padding(.horizontal)
    .offset(y: 460)
  }
  
  private var buttonSection: some View {
    HStack {
      
      Text("Forgot Password?")
        .font(.subheadline)
      
      Spacer()
      
      Button {
        handleLogin()
      } label: {
        Text("Log in")
          .foregroundColor(.black)
          .padding(12)
          .padding(.horizontal, 30)
          .background(Color.theme.card2)
          .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
          .shadow(color: .theme.card2.opacity(0.3), radius: 20, x: 0, y: 20)
          .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
          }
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
    .padding(40)
    
  }
}

// MARK: - Member Methods
extension LoginView {
  
  private func handleLogin() {
    if email.isEmpty {
      focusedField = .email
    }
    else if password.isEmpty {
      focusedField = .password
    }
    else {
      focusedField = nil
      print("handle login")
      isLoading = true
      
      // login
      Auth.auth().signIn(withEmail: email, password: password) { result, error in
        
        isLoading = false

        guard let result = result, error == nil else {
          alertMessage = error?.localizedDescription ?? ""
          showAlert = true
          return
        }

        success = true
        userStore.isLoggedIn = true
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
          success = false
          userStore.showLogin = false
        }
        
      }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
      .environmentObject(UserStore())
  }
}
