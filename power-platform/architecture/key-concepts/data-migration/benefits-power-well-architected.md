---
title: Power Platform Well-Architected pillars and data migration
description: Power Platform Well-Architected pillars guide you to plan and execute secure, efficient data migrations. Explore benefits and practical strategies.
#customer intent: As a Power Platform architect, I want to understand how to apply Power Platform Well-Architected pillars to data migration so that I can plan secure and efficient migrations.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 05/22/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:05/21/2025
---

# Power Platform Well-Architected pillars and data migration

Data migration is a critical step in modernizing business systems and ensuring seamless operations. The [Power Platform Well-Architected](../../../well-architected/what-is-power-well-architected.md) framework provides proven guidance to help you plan and execute workloads that are reliable, secure, and efficient. This article outlines the key benefits of following Power Platform Well-Architected pillars for data migration, including improved reliability, enhanced security, operational excellence, performance efficiency, and optimized user experience.

## Reliability

This architecture ensures reliability through several key infrastructure choices:

- **Regional proximity**: Hosting the virtual machine (VM) in the same region as Dataverse reduces latency and improves data transfer speeds, enabling efficient and stable migrations.
- **High-capacity virtual machine (VM)**: A D4-series VM (8 cores, 28-GB RAM, 500-GB storage) supports high-volume data processing without performance degradation.
- **Local database**: Using a local database instead of an Azure-hosted one reduces reliance on external services, minimizing the risk of connectivity issues or service outages.
- **Co-located Azure Data Factory**: Deploying Azure Data Factory in the same region as Dataverse ensures consistent, high-throughput data processing.

This architecture ensures a dependable and efficient data migration process by combining performance-optimized infrastructure, resilient design, and operational simplicity.

- **Design for business requirements**
    - Engage business stakeholders early to identify relevant data segments.
    - Add tracking columns such as `Processing Flag`, `Action Flag`, and `DataMigration Created Date Time` to monitor migration progress at a granular level.

- **Resiliency**
    - Implement failover mechanisms and per-table error handling.
    - Maintain dedicated success and error tables to track migration outcomes clearly.

- **Recovery**
    - Use intermediate staging databases to enable full backups and recovery.
    - Avoid relying solely on application-layer tools, which complicate recovery and state tracking.
    - Reprocessing failed records is simpler with a structured staging environment.

- **Self-support**
    - A clear schema and systematic approach allow team members to support each other.
    - Migration status can be easily understood by reviewing table-level progress, even if key personnel are unavailable.

- **Simplicity**
    - The architecture is straightforward and easy to adopt.
    - Any data migration developer can implement it with minimal onboarding.

## Security

Security is foundational to data migration. This architecture incorporates multiple strategies to protect sensitive data and maintain integrity, confidentiality, and availability throughout the migration lifecycle.

- **Core security practices**:
    - **Encryption**: Use strong encryption for data in transit and at rest to safeguard sensitive information.
    - **Access control**: Apply least-privilege access principles. Grant permissions only to authorized personnel to reduce internal risk.
    - **Monitoring and auditing**: Enable real-time monitoring and alerts to detect suspicious    activity. Conduct regular security audits and vulnerability assessments.
    - **Compliance**: Follow industry standards and best practices to protect against internal and external threats.

- **Security readiness**
    - In Dataverse, security is role-based and tied to ownership and business units.
    - Use disabled user accounts as stubs with minimal privileges (for example, the “Salesperson” role).
    - Store source data in secure environments such as VMs or databases with restricted access.

- **Protecting confidentiality**
    - Assign data ownership to appropriate business units and roles.
    - Maintain confidentiality from source to target by masking sensitive data in lower environments.
    - Run migration jobs in isolated environments with business user support to limit exposure.

- **High availability**
    - Dataverse provides built-in high availability as a SaaS platform.
    - Use intermediate databases with regular backups during migration to prevent data loss and support recovery.

- **Maintaining security**
    - Preserve ownership mappings during migration to maintain access controls.
    - Decommission staging databases after validation to eliminate unnecessary exposure.

## Operational Excellence

Operational Excellence in data migration is achieved through strategic planning, continuous improvement, and adherence to best practices. This architecture is designed to deliver secure, high-performance migrations with minimal disruption.

- **Efficient and secure design**: The architecture ensures data is migrated efficiently and securely, maintaining high performance and reliability throughout the process.
- **Continuous improvement**: Regular audits and assessments identify opportunities to refine processes and adopt innovative solutions.
- **Streamlined execution**: Advanced technologies and methodologies reduce downtime and minimize business disruption.
- **Proactive monitoring**: Real-time monitoring and alerting provide visibility into migration progress, enabling rapid response to issues.
- **On-time, on-budget delivery**: This proactive approach ensures migrations meet timelines, budgets, and quality standards.

- **Embrace fusion development**: Fusion development fosters collaboration between developers, IT, and business users, enabling faster, more tailored migration solutions. Low-code tools empower business users to actively contribute, reducing reliance on IT and accelerating delivery. This approach ensures alignment across stakeholders and drives more effective execution of the migration strategy.

- **Establish development standards**: Consistent development standards are key to predictable, scalable, and high-quality migrations. These standards cover coding practices, documentation, testing, and validation. By following them, teams reduce errors, improve reliability, and ensure repeatable outcomes. Standardization also enhances collaboration and communication, enabling more efficient project execution across teams.

- **Improve operations with monitoring and insights**: Advanced monitoring and analytics provide real-time visibility into the migration process. These tools track key performance indicators (KPIs), generate detailed progress reports, and help detect issues early—minimizing downtime and disruption. Continuous monitoring supports proactive resolution and informs future migrations, driving ongoing improvement and process optimization.

- **Deploy with confidence**: This architecture supports a reliable deployment process through rigorous testing and validation. Unit, integration, and user acceptance testing ensure that migrated data is accurate, complete, and functional in the target environment. Thorough predeployment validation minimizes post-migration issues and enables a smooth transition for end users. This disciplined approach builds stakeholder confidence and helps ensure a successful, on-time migration.

- **Automate for efficiency**: Automation enhances efficiency and reduces human error in data migration. Scripts and workflows handle repetitive tasks such as ETL, validation, and testing—ensuring speed, consistency, and accuracy. This frees up resources for higher-value activities like optimization and stakeholder engagement. Automation also simplifies scaling for large or complex migrations, making the process more manageable and reliable.

- **Adopt safe deployment practices**: Safe deployment practices protect data integrity and security throughout the migration. Key strategies include:
    - **Backup and recovery**: Implement robust backup procedures and recovery plans to safeguard against data loss.
    - **Predeployment testing**: Conduct thorough testing to validate changes before rollout.
    - **Change control**: Document and review all changes to ensure traceability and accountability.
    - **Phased rollout**: Deploy in stages to minimize risk and enable quick rollback if needed.

    Prioritizing safety and control during deployment ensures a smooth migration and protects critical data assets.

## Performance Efficiency

Advanced monitoring and automation tools enhance the speed, reliability, and efficiency of data migration. Real-time tracking of key performance indicators (KPIs)—such as data transfer rates, system resource usage, and error rates—helps identify and resolve bottlenecks quickly. Automated scripts and workflows reduce manual effort, minimize errors, and improve consistency. This performance-focused approach ensures a smooth migration and supports continuous optimization.

- **Realistic performance**: Achieving realistic performance in data migration starts with setting attainable goals based on thorough testing and analysis. The architecture accounts for the capabilities and limitations of both source and target systems to define practical performance benchmarks. This approach prevents system overload, reduces failure risk, and keeps the migration aligned with project timelines and resource constraints—ensuring a stable and successful execution.

- **Designed to meet performance requirements**: The data migration architecture is built to meet strict performance standards through best practices in coding, testing, and validation. Rigorous performance testing simulates real-world scenarios to uncover potential issues early. Scalable design elements—such as load balancing and parallel processing—enable efficient handling of large data volumes. This approach ensures the migration process meets defined performance benchmarks and supports a smooth, high-speed transition to the target system.

- **Achieving and sustaining performance**: Maintaining high performance during data migration requires proactive monitoring and continuous optimization. Real-time tracking ensures issues are identified and resolved quickly, keeping the migration on track. Regular performance reviews and adjustments help sustain optimal throughput. This responsive approach ensures consistent performance and supports a smooth, efficient migration process.

- **Improving efficiency through optimization**: Efficiency in data migration is driven by continuous optimization and automation. Automated ETL workflows reduce manual effort and accelerate delivery, while advanced analytics identify bottlenecks and guide improvements. This approach minimizes downtime, enhances accuracy, and ensures a smoother, more efficient migration process.

## Experience Optimization

Optimizing the migration experience focuses on making the process intuitive, efficient, and productive for both developers and end users. Apply a user-centric design and use modern tools for the architecture to reduce disruption and enhance satisfaction.

- **Design for the developer and end user**: A structured approach to Dataverse migration gives developers clarity—from data extraction and staging to transformation and loading. Designing with both developers and end users in mind ensures a smoother, more effective process.

    Key elements include:

    - **Intuitive SQL:** Use clear, user-friendly SQL structures and step-by-step processes to simplify complex tasks and reduce errors.

    - **Comprehensive documentation:** Provide well-organized, accessible documentation to support self-service and build confidence.

    - **Scalable solutions:** Design for flexibility—whether handling small or large datasets—using techniques like load balancing and parallel processing to maintain performance.

- **Design for simplicity**: Simplified workflows and automation reduce complexity and errors. Modular architecture and clear documentation make components easier to understand, maintain, and scale. Prioritizing simplicity shortens the learning curve and accelerates adoption across teams.

## Next step

> [!div class="nextstepaction"]
> [Data migration planning for go-live](cut-over-planning.md)
