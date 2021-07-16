# T3A2-A - Full Stack App - Lease Connect
Coder Academy CA0121 Final project\
Collaborators: Gemma Elsom, Rafael Mello, Sara Fishburn

**Trello Board:** https://trello.com/b/yLfsMnFc \
**Backend Repo:** https://github.com/SaraFishburn/lease_connect_api \
**Frontend Repo:** \
**Dataflow Diagram:** https://lucid.app/lucidchart/c748d4d5-41ff-4216-b178-49f2531033b7/view


## Lease Connect - Description
- Purpose

  One of the most common causes of frustration for tenants and property managers is the lack of or difficulty in contact. Missing calls and emails without replies can make people frustrated. And this is not very good for the business.
  A property manager should be reachable to their tenants without endless emails. 

  The purpose of Lease Connect is to relieve some of these frustrations.

   Managers or their teams can provide the best solution to the issue during business hours. With property management software the communication can go smoothly and without inconvenience at any time.
  Also property managers have a very busy life. At the office, on the road or visiting properties, they are always on the go. Having a mobile version all in one management application can help them to do the work wherever they are.

- Functionality / features

  There are three main features of Lease Connect.

  - **Maintenance Request** \
    If a tenant needs to speak to their property manager about, for example, a maintenance issue, they can do it anytime lodging an application.

  - **Documentation**

  - **Calendar**



- Target audience
  The target audience for Lease Connect from a client perspective is real estate agencies located in metropolitan areas in Australia. Mainly concentrated in the rentals department of those businesses. Companies that appreciate tech solutions and see the digital transformation as a great opportunity to create a more efficient and cohesive service to their tenants.

  The other audience this application is purposed for is the tenants of these businesses that appreciate a technology based solution to the communication issues that arise when renting a property managed by a real estate.

- Tech stack

## Dataflow Diagram

The following diagram outlines the flow and storage of data throughout the application. All data flow begins with the action of an external entity which in this case is a user of the application. The user action triggers a process on the front end that in turn activates a process on the backend server via a request to the backend API. The server then queries or stores data in the database and sends a response back to the frontend where appropriate.

![Dataflow Diagram](docs/lease_connect_dataflow_diagram.png)

## Application Architecture Diagram

## User Stories
### MVP

  #### General Features
  [GENERAL] As a user I want an option for me to update my contact details so that my property manager can always contact me.


  [GENERAL] As an admin, I can create a household account with temporary login details so that I have control over who has an account.

  [GENERAL] As an admin, I can create a property manager account with temporary details so that I can control who has access to household details.

  [GENERAL] As an admin, I have the ability to delete household and property manager accounts so that I have control of who can access household details.

  [GENERAL] As a user, I want to be able to log in, so that I can access my account.

  #### Maintenance Request
  [MAINTENANCE] As a property manager, I want to see which tenant made the maintenance request, so I can know who made the request and where I should send my maintenance team

  [MAINTENANCE] As a property manager, I want to see all the maintenance jobs requests, so I can help the tenants to get their problem fixed

  [MAINTENANCE] As a tenant, I want to upload a photo of my problem, so the property manager can understand clearly what is the problem

  [MAINTENANCE] As a tenant, I want to lodge a maintenance job when I have something to get fixed at the property, so I can get the problem solved

  #### Documentation
  [DOCUMENTATION] As a property manager, I want to be able to serve tenants with documents, so that I don't have to send them emails with pdf attachments.

  [DOCUMENTATION] As a user, I want to be able to see all documentation that relates to the household.

  #### Calendar

  [CALENDAR] As a property manager, I want to be able to clearly see all commitments I have on a given day, so that I can be sure to not miss anything important.

  [CALENDAR] As a tenant, I want to have full coverage of any important dates, visits or inspections so that I can plan my life around these appointments.

  [CALENDAR] As a property manager, I want to have all of my tenants lease dates in my calendar so that all of the information is stored in one, easy to read place

  [CALENDAR] As a property manager, I want all maintenance appointments to be stored in the calendar, and for the tenant to be able to see them too. This is so that both parties are aware of when a visitor will be attending the property.

### Non-MVP

  #### Maintenance
  [MAINTENANCE] As a tenant, I want to track my maintenance job application, so I can monitor my application and know what happens next

  #### Documentation
  [DOCUMENTATION] As a tenant, I want to sign my lease renewal using an online form, so that I dont need to print and fill a pdf document.

  [DOCUMENTATION] As a tenant, I want to sign my entry condition report online so that I don't have to print and fill a pdf document.

  [DOCUMENTATION] As a tenant, I want to review and print my previously signed documents so that I can always have a hard copy.

  [DOCUMENTATION] As a tenant, I want the option to save my signature for future use so that I don't have to manually sign/upload my signature for each document.

  [DOCUMENTATION] As a tenant, I want to receive a notification on my portal dashboard when a document has been uploaded for me to sign so that I don't forget.

  #### Calendar
  [CALENDAR] As a property manager, I want to be able to add reminders for inspections that tenants can also see, so that everyone is aware of upcoming important dates

  [CALENDAR] As a property manager, I want to be able to add things to my calendar that only I have visibility to, so that I can choose what information is visible by the tenants

  [CALENDAR] As a property manager, I want to be able to block out periods of time that I am OOO and cannot assist with enquiries, so that tenants are aware of why I may not respond immediately.

## Wireframes

## Trello Screenshots

![Trello Screenshot](docs/trello_screenshots/2021-07-13_8.40am.png)
![Trello Screenshot](docs/trello_screenshots/2021-07-13_12.56pm.png)
![Trello Screenshot](docs/trello_screenshots/2021-07-14_8.55am.png)
![Trello Screenshot](docs/trello_screenshots/2021-07-15_1.15pm.png)
![Trello Screenshot](docs/trello_screenshots/2021-07-15_10.07am.png)
![Trello Screenshot](docs/trello_screenshots/2021-07-16_9.30am.png)

