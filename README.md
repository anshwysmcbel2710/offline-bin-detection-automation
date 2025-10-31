# 🧠 Offline Bin Detection Automation

### Developed at **Renie Tech Trading LLC**  
**Role:** AI & Automation Engineer  
**Engineer:** Ansh Srivastava
**Year:** Jul - Aug 2025  

---



## 🚀 Project Overview

**Offline Bin Detection Automation** is an intelligent, cloud-based workflow automation platform designed to **detect, classify, and service offline IoT smart bins** in real time.  

Built entirely using **n8n** and integrated with multiple APIs, this system automates the complete operational lifecycle — from detection to alerting, escalation, and field servicing — achieving **90% manual work reduction** and **zero missed escalations**.

---



## 🧩 Modular Architecture

The automation platform is composed of **8 modular workflows**, each built as an independent yet interconnected service within n8n:

| # | Module | Purpose |
|---|---------|----------|
| **1** | Detection & Storage of Offline Bins | Detects offline bins from Renie API and logs data in Supabase |

| **2** | Alert Creation & POC Communication | Creates alerts and sends notifications via Twilio and SMTP |

| **3** | POC Response Handling | Captures and processes acknowledgment responses |

| **4** | POC Reminder Notifications | Sends timed reminders to unresponsive POCs |

| **5** | Servicing Task Creation | Auto-creates tasks in Monday.com for unresolved bins |

| **6** | Route Optimization & Notification | Uses Google Maps API to optimize routes and notifies via Telegram |

| **7** | Scheduled Power Shutdown | Handles planned outages to prevent false offline alerts |

| **8** | Escalation Management | Escalates unresolved cases across hierarchy levels |

---



## ⚙️ System Components

| Category | Tools & Services |
|-----------|------------------|
| **Automation Engine** | n8n (Node-based Workflow Automation) |
| **Database** | PostgreSQL (Supabase Cloud DB) |
| **Communication APIs** | Twilio API, SMTP Email |
| **Task Management** | Monday.com API |
| **Routing & Optimization** | Google Maps API |
| **Notifications** | Telegram Bot API |
| **Deployment** | Cloud Infrastructure (API-driven Integration) |

---

## 🧠 Core Capabilities

- Seamless integration with **Renie IoT API** for real-time data ingestion  
- Dynamic **Supabase (PostgreSQL)** database creation and updates  
- **Automated POC alerting and acknowledgment tracking**  
- **Monday.com task creation** and synchronization with escalation states  
- **Route optimization** using Google Maps API  
- **Live Telegram notifications** for on-field technicians  
- **Automated escalation workflows** for missed SLAs  

---

## 🧩 Architecture Flow

1. **Detection:** n8n fetches bin data from Renie API.  
2. **Database Update:** Stores offline bin info in Supabase.  
3. **Alerting:** Sends SMS (Twilio) + Email (SMTP) notifications to POCs.  
4. **Response Tracking:** Records acknowledgments or triggers reminders.  
5. **Task Automation:** Creates Monday.com tickets for unresolved cases.  
6. **Route Optimization:** Generates optimized routes using Google Maps API.  
7. **Field Notification:** Sends route and task info via Telegram.  
8. **Escalation:** Initiates multi-level escalation based on SLA breaches.  

---

## 📈 Achievements & Impact

| Metric | Result |
|--------|--------|
| Manual Escalation Work | ⬇️ Reduced by **90%** |
| Missed Offline Alerts | 🚫 **Zero** after deployment |
| SLA Compliance | ✅ **100% adherence** |
| Response Time | ⚡ **65% faster** |
| Notification Reliability | 📲 **99.7% success rate** |

---

## 🧮 Validation & CI/CD

Automated validation ensures every workflow JSON is safe and functional:


### Local Validation
```bash
bash scripts/validate-workflows.sh
