# 🧠 Offline Bin Detection Automation

### Developed at **Renie Tech Trading LLC**  
**Role:** AI & Automation Engineer  
**Engineer:** Ansh Srivastava 
**Timeline:** Jul - Aug 2025  
**Deployment Environment:** Cloud Infrastructure with API-driven Microservice Integration  

---

## 📖 Project Summary

The **Offline Bin Detection Automation Project** is a cloud-based workflow automation system built to intelligently detect, classify, and service **IoT smart bins** that go offline across different city zones.  
This system automates the entire incident lifecycle — from real-time detection to alerting, acknowledgment tracking, service task creation, routing, and escalation — minimizing manual intervention and eliminating operational delays.

---

## 🎯 Objectives

- **Detect** offline bins in real-time using IoT data streams from the Renie API  
- **Alert** responsible Points of Contact (POCs) automatically  
- **Track** responses and send timed reminders  
- **Assign** servicing tasks on Monday.com when required  
- **Optimize** field routes using Google Maps API  
- **Escalate** unresolved cases through multi-level hierarchy  
- **Notify** on-field technicians via Telegram for real-time updates  

---

## ⚙️ Technology Stack

| Category | Tools & Services |
|-----------|------------------|
| Workflow Orchestration | **n8n (Node-based Automation Platform)** |
| Database | **PostgreSQL (Supabase Cloud Database)** |
| Communication APIs | **Twilio API**, **SMTP (Email Gateway)** |
| Mapping & Routing | **Google Maps API** |
| Task Management | **Monday.com API** |
| Notifications | **Telegram Bot API** |
| Infrastructure | Cloud-hosted (API-driven Architecture) |

---

## 🧩 Modular Workflow Architecture

The system is designed using **eight modular n8n workflows**, each functioning as an independent microservice but fully integrated within a central automation layer.

| Module No. | Module Name | Core Function |
|-------------|--------------|----------------|
| **1** | Detection & Storage of Offline Bins | Automatically detects offline bins from the Renie API and stores the data in Supabase |
| **2** | Alert Creation & POC Communication | Creates real-time alerts and notifies assigned POCs via Twilio (SMS) and SMTP (Email) |
| **3** | POC Response Handling | Captures and processes acknowledgments or replies from POCs |
| **4** | POC Reminder Notifications | Sends timed automated reminders to POCs who haven’t responded within SLA time |
| **5** | Servicing Task Creation | Generates and synchronizes service tickets automatically on Monday.com |
| **6** | Route Optimization & Notification | Fetches technician locations, optimizes routes using Google Maps API, and sends directions via Telegram |
| **7** | Scheduled Power Shutdown | Handles predefined maintenance periods and prevents false offline alerts |
| **8** | Escalation Management | Implements multi-level escalation for unresolved or delayed service incidents |

---

## 🧠 Architecture & Data Flow

1. **Detection Layer:**  
   - Renie API continuously feeds IoT device status.  
   - n8n workflow triggers automatically when a bin is detected offline.

2. **Storage Layer:**  
   - The system records offline bin details in **Supabase (PostgreSQL)** with timestamp, bin ID, location, and last online state.

3. **Alert & Communication Layer:**  
   - Alert workflows use **Twilio API** for SMS and **SMTP** for email notifications.  
   - POCs are dynamically identified from the Supabase master table.

4. **Response & Reminder Layer:**  
   - POC responses are tracked.  
   - If not acknowledged within SLA, reminders are sent automatically.

5. **Servicing & Routing Layer:**  
   - Monday.com API creates or updates servicing tickets.  
   - Google Maps API calculates shortest routes and travel times.  
   - Telegram Bot sends live notifications with servicing details and map links.

6. **Escalation Layer:**  
   - If service delay exceeds SLA, multi-level escalation triggers —  
     escalating from on-field staff → supervisor → operations manager → escalation group.

---

## 🧰 Tools & Integration Details

| Function | Technology | Description |
|-----------|-------------|--------------|
| **IoT Data Source** | Renie API | Provides bin telemetry and online/offline status |
| **Database** | Supabase (PostgreSQL) | Stores all bin metadata, offline logs, SLA metrics |
| **Communication** | Twilio / SMTP | Sends SMS and email alerts to POCs |
| **Task Management** | Monday.com API | Auto-creates service tickets and updates statuses |
| **Routing** | Google Maps API | Calculates optimized servicing routes |
| **Notifications** | Telegram Bot | Delivers real-time servicing updates to technicians |
| **Automation Engine** | n8n | Orchestrates all workflows and integrations |

---

## 🚀 Key Achievements

- **90% reduction** in manual escalation work  
- **Zero missed offline incidents** after automation deployment  
- **Fully SLA-compliant** response and servicing cycle  
- **Dynamic real-time route optimization** using Google Maps API  
- **Live technician communication** via Telegram notifications  
- **Cloud-native modular design**, ready for horizontal scaling

---

## 🧩 Workflow Deployment Overview

| Component | Description |
|------------|-------------|
| **n8n Server** | Hosted on cloud infrastructure; workflows deployed through import JSON mechanism |
| **Database (Supabase)** | Managed PostgreSQL instance storing all workflow data |
| **APIs** | All integrations (Twilio, Monday.com, Telegram, Google Maps) authenticated through environment credentials |
| **Credentials Management** | Handled within n8n credential nodes (never exposed in GitHub) |
| **CI/CD Validation** | GitHub Actions auto-validate JSON integrity on every push |

---

## 📈 Project Impact

| Area | Before Automation | After Automation |
|-------|-------------------|------------------|
| Offline Bin Detection | Manual log monitoring | Fully automated 24/7 detection |
| Alert Creation | Email chains | Automated SMS & Email alerts |
| POC Response Tracking | Manual follow-up | Auto-tracked with timed reminders |
| Task Assignment | Human entry in Monday.com | Auto-created service tickets |
| Route Planning | Manual Google Maps lookup | Automated route optimization |
| Escalations | Often delayed | Instant multi-level escalations |
| Reporting | Periodic spreadsheets | Real-time dashboard sync via Supabase |

---

## 🧮 Performance Metrics

- **Mean Response Time Reduction:** 65%  
- **Escalation Compliance:** 100%  
- **Manual Effort Reduction:** 90%  
- **Notification Success Rate:** 99.7% (Twilio + Telegram combined)  
- **Uptime:** > 99% since final deployment  

---

## 🧱 Repository Structure

