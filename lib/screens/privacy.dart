import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: Center(child: Text('Privacy Policy')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 15),
          child: Column(
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 15,
              // ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    '''Privacy Policy
      Introduction
      Welcome to the CSEC-ASTU Hackathon Application ("the App"). We are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your information when you use our App.
      
      Information We Collect
      Personal Information
      When you use our App, we may collect the following personal information:
      
      Name
      Email Address
      Year of Study
      Department
      Academic Information
      To provide tailored content and features, we may collect academic information such as:
      
      Grades for Individual Courses
      Class Schedules
      Course Outlines
      Usage Data
      We may also collect information automatically when you use the App, such as:
      
      IP Address
      Device Information
      Browser Type
      Operating System
      Usage Details (e.g., time and date of access, pages viewed, and other usage data)
      How We Use Your Information
      We use the information we collect for various purposes, including:
      
      To Provide and Maintain the Service: Ensuring the App functions as intended and provides a valuable tool for managing academic and campus life.
      To Personalize User Experience: Tailoring content and notifications based on your academic stage and field.
      To Improve the App: Analyzing usage data to enhance the App's features, performance, and user experience.
      To Communicate with You: Sending important updates, notifications, and other information related to the App and its features.
      Sharing Your Information
      We do not sell, trade, or otherwise transfer your personal information to outside parties. However, we may share your information in the following situations:
      
      With Service Providers: We may share your information with third-party service providers who assist us in operating the App and providing the services.
      For Legal Reasons: We may disclose your information if required by law or in response to valid requests by public authorities.
      Data Security
      We implement a variety of security measures to maintain the safety of your personal information. These measures are designed to protect your data from unauthorized access, disclosure, alteration, and destruction.
      
      Your Rights
      Depending on your jurisdiction, you may have the following rights regarding your personal information:
      
      Access: You may request access to the personal information we hold about you.
      Correction: You may request that we correct any inaccuracies in your personal information.
      Deletion: You may request that we delete your personal information, subject to certain exceptions.
      Restriction: You may request that we restrict the processing of your personal information.
      Portability: You may request a copy of your personal information in a structured, commonly used, and machine-readable format.
      To exercise any of these rights, please contact us using the contact information provided below.
      
      Changes to This Privacy Policy
      We may update this Privacy Policy from time to time. Any changes will be posted on this page, and the updated policy will take effect upon posting.
      
      Contact Us
      If you have any questions or concerns about this Privacy Policy or our data practices, please contact the hackathon organizers at:
      
      Email: abelbk06@gmail.com
      
      Phone: +251984981703
      
      Thank you for using the CSEC-ASTU Hackathon Application. We are committed to protecting your privacy and providing a secure and user-friendly experience.''',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
