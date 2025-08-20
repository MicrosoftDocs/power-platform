---
title: Recommendation checklist for Security for Power Platform workloads
description: Use this checklist for Security to identify the best approach for secure, governed, and compliant Power Platform workloads.
author: robstand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: checklist
ms.date: 08/18/2025
---

# Recommendation checklist for Security

This checklist presents a set of security recommendations to help you ensure your workload is secure. If you don't review the checklist and weigh the associated tradeoffs, you may expose your design to potential risks. Thoroughly assess all the aspects outlined in the checklist to enhance your confidence in the security of your workload.

## Checklist

|&nbsp;|Code|Recommendation|
|---|---|---|
|&#9744;|[SE:01](./establish-baseline.md)|**Establish a security baseline** that's aligned to compliance requirements, industry standards, and platform recommendations. Regularly measure your workload architecture and operations against the baseline to sustain or improve your security posture over time.|
|&#9744;|[SE:02](./secure-development-lifecycle.md)<br>[SE:02](./threat-model.md)|**Maintain a secure development lifecycle** by using a hardened, mostly automated, and auditable software supply chain. Incorporate a secure design by using threat modeling to safeguard against security-defeating implementations.|
|&#9744;|[SE:03](./data-classification.md)|**Classify and consistently apply sensitivity and information type labels** on all workload data and systems involved in data processing. Use classification to influence workload design, implementation, and security prioritization.|
|&#9744;|[SE:04](./segmentation.md)|**Create intentional segmentation and perimeters** in your architecture design and in the workload's footprint on the platform. The segmentation strategy must include networks, roles and responsibilities, workload identities, and resource organization.|
|&#9744;|[SE:05](./identity-access.md)|**Implement strict, conditional, and auditable identity and access management (IAM)** across all workload users, team members, and system components. Limit access exclusively to *as necessary*. Use modern industry standards for all authentication and authorization implementations. Restrict and rigorously audit access that's not based on identity.|
|&#9744;|[SE:06](./encryption.md)|**Encrypt data by using modern, industry-standard methods** to guard confidentiality and integrity. Align the encryption scope with data classifications, and prioritize native platform encryption methods.|
|&#9744;|[SE:07](./application-secrets.md)|**Protect application secrets** by hardening their storage and restricting access and manipulation and by auditing those actions. Run a reliable and regular rotation process that can improvise rotations for emergencies.|
|&#9744;|[SE:08](./monitor-threats.md)|**Implement a holistic monitoring strategy** that relies on modern threat detection mechanisms that can be integrated with the platform. Mechanisms should reliably alert for triage and send signals into existing SecOps processes.|
|&#9744;|[SE:09](./testing.md)|**Establish a comprehensive testing regimen** that combines approaches to prevent security issues, validate threat prevention implementations, and test threat detection mechanisms.|
|&#9744;|[SE:10](./incident-response.md)|**Define and test effective incident response procedures** that cover a spectrum of incidents, from localized issues to disaster recovery. Clearly define which team or individual runs a procedure.|

## Next steps

> [!div class="nextstepaction"]
> [Security tradeoffs](tradeoffs.md)
