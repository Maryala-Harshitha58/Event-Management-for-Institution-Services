
# Event Management System for Institution Services

A Salesforce-based Event Management System designed for institutional services to streamline event organization, management, and tracking. This system caters to various campus services, including workshops, seminars, orientation sessions, counseling sessions, and cultural events, improving engagement and communication across students, faculty, and staff.


## Project Overview

This Event Management System aims to provide an efficient solution for organizing and managing events within an institution. Built on the Salesforce platform, the system leverages standard Salesforce objects, custom objects, and Apex code to enable comprehensive event management, automated communication, and real-time reporting. The project is designed to save time, improve event attendance, and provide data-driven insights for institutional events.

## Features

- **Centralized Event Dashboard**: Manage and monitor events from a single interface.
- **Registration and Enrollment Management**: Enable students and staff to register for events, manage capacity, and handle waitlists.
- **Automated Notifications and Reminders**: Send updates to participants via email or SMS to keep them informed.
- **Customizable Forms and Surveys**: Tailor registration forms and post-event feedback to gather insights.
- **Real-Time Attendance Tracking**: Use check-in/check-out features to track attendance.
- **Resource Management**: Allocate and manage venues, equipment, and other resources effectively.
- **Detailed Reporting and Analytics**: Track event performance with reports and dashboards.
- **Integration with Calendar and Portals**: Sync with student and staff calendars for seamless updates.

## Getting Started

These instructions will guide you through setting up and running the Event Management System on a Salesforce environment.

### Prerequisites

- A Salesforce Developer account or access to a Salesforce org.
- Basic understanding of Salesforce components: Objects, Apex, Flows, Lightning Experience.
- [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli) installed for deploying the project.
- A GitHub account to clone the repository.

### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Maryala-Harshitha58/Event-Management-for-Institution-Services.git
   cd event-management-institution-services
   ```

2. **Authenticate Salesforce Org** (using Salesforce CLI)
   ```bash
   sfdx auth:web:login -a MyOrgAlias
   ```

3. **Push Source to Salesforce Org**
   ```bash
   sfdx force:source:push -u MyOrgAlias
   ```

4. **Assign Permission Sets**
   Assign necessary permission sets for users to access and manage events.
   ```bash
   sfdx force:user:permset:assign -n Event_Manager
   ```

5. **Data Import** (Optional)
   Load sample data for testing, if available, via the Data Import Wizard in Salesforce.

### Usage

- **Event Creation**: Create and configure events from the Event Dashboard.
- **Registration**: Students and staff can register for events, with capacity and waitlist management.
- **Notifications**: Participants receive automated notifications and reminders.
- **Attendance Tracking**: Check-in/out options available for real-time tracking.
- **Reports**: Use built-in reports and dashboards for analytics on event performance.
### Output


![image](https://github.com/user-attachments/assets/6a867228-a04c-44d4-a743-debcc7cc389c)


![image](https://github.com/user-attachments/assets/d7ac8f44-9c6b-4bc1-915e-4c82926c1a92)



![image](https://github.com/user-attachments/assets/c36ff84b-c561-492c-8479-78d1cbad1ed7)


## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m "Add feature"`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a pull request.

## License

This project is licensed under the MIT License. 
