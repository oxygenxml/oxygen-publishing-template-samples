# Send Feedback Email
This template adds a link in footer to send feedback emails.

The link uses mailto and a generic address and an additional JavaScript processing inserts the Publication Name and the Breadcrumb path as email Subject. The final result being:
```
<div class="mail_feedback">
  <span>
    <a href="mailto:someone@oxygenxml.com?subject=Map%20-%20Path%20%2F%20To%20%2F%20Topic">Give us feedback</a>
  </span>
</div>
```  