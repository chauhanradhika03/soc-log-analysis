# soc-log-analysis
Linux-based SOC log analysis project for detecting failed SSH login attempts and identifying brute-force patterns using journalctl and command-line tools.

**Objective**

To analyze SSH authentication logs and identify potential brute-force login attempts using Linux command-line tools.

**Tools Used**

* Linux (Kali)
* journalctl
* grep
* awk
* uniq

**Steps Performed**

1. **Installed and started SSH service**
2. **Generated failed login attempts using :**

   *for i in {1..3}; do ssh fakeuser@localhost; done*
3. **Collected logs using :**
   
   *sudo journalctl -u ssh*
4. **Filtered failed login attempts :**
   
   *sudo journalctl -u ssh | grep "Failed"*
5. **Counted failed attempts :**
   
   *sudo journalctl -u ssh | grep "Failed" | wc -l*

**Analysis & Findings**

* Multiple failed login attempts were detected
* Attempts were made using an invalid username:
  *fakeuser*
* Source IP(IPv6) address identified:
  *::1* 
* Repeated attempts indicate a potential *brute-force attack pattern*

**Key Commands Used**

* **Count failed attempts :**

  *sudo journalctl -u ssh | grep "Failed" | wc -l*

* **Extract IP addresses :**
  
   *sudo journalctl -u ssh | grep "Failed" | awk '{print $(NF-3)}'*

* **Identify most frequent IP :**
  
  *sudo journalctl -u ssh | grep "Failed" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr*

**Conclusion**

The analysis successfully identified repeated failed login attempts from a single IP address, simulating a brute-force attack scenario. This demonstrates basic SOC-level log monitoring and threat detection skills.

**Screenshots**

**Failed login attempts**

<img width="955" height="275" alt="Screenshot_2026-05-03_02_16_042" src="https://github.com/user-attachments/assets/8b8e693b-6aa1-42f2-aa81-d390faa1ee78" />

**IP analysis**

<img width="955" height="164" alt="Screenshot_2026-05-03_02_16_292" src="https://github.com/user-attachments/assets/fd3edf88-5135-406e-b33a-d79114428a13" />

**Future Improvements**

* Automate detection using scripts
* Integrate with SIEM tools
* Set up alerting for repeated failed logins

