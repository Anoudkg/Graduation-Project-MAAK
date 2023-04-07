//
//  SendSMS.swift
//  Maak3
//
//  Created by Alanoudkhalid on 23/07/1444 AH.
//
import SwiftUI
import MessageUI
/// Main View
struct ViewController: View {

    private let mailComposeDelegate = MailComposerDelegate()

    private let messageComposeDelegate = MessageComposerDelegate()

    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                self.presentMailCompose()
            }) {
                Text("email")
            }

            Spacer()

           Button(action: {
               self.presentMessageCompose()
           }) {
               Text("Message")
           }
            Spacer()
        }
    }
}
extension ViewController {

    private class MailComposerDelegate: NSObject, MFMailComposeViewControllerDelegate {
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {

            controller.dismiss(animated: true)
        }
    }
    /// Present an mail compose view controller modally in UIKit environment
    private func presentMailCompose() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        let vc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = mailComposeDelegate

        vc?.present(composeVC, animated: true)
    }
}

extension ViewController {

    private class MessageComposerDelegate: NSObject, MFMessageComposeViewControllerDelegate {
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            // Customize here
            controller.dismiss(animated: true)
        }
    }
    /// Present an message compose view controller modally in UIKit environment
    private func presentMessageCompose() {
        guard MFMessageComposeViewController.canSendText() else {
            return
        }
        let vc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = messageComposeDelegate

        vc?.present(composeVC, animated: true)
    }
}

