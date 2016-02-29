/*

PT: Esse script é usado para procurar os logs de e-mails enviado pelo Database Mail.
EN: This script is used to search the log of e-mails sent by Database Mail.
FR: Ce script est utilisé pour rechercher le log des e-mails envoyés pour le Database Mail.

*/

USE msdb ;
GO

-- show a list of all mail-items send past week
SELECT 
       sysmail_allitems.mailitem_id
       , sent_status
       , recipients
       , subject, body
       , send_request_date
       , send_request_user
       , sent_date
       , sysmail_allitems.last_mod_date
       , sysmail_event_log.event_type
       , sysmail_event_log.description
FROM msdb.dbo.sysmail_allitems 
       LEFT OUTER JOIN msdb.dbo.sysmail_event_log
             ON sysmail_allitems.mailitem_id = sysmail_event_log.mailitem_id
where send_request_date > dateadd(dd, -7, getdate())
       --and sent_status = 'failed'
order by
       send_request_date desc
