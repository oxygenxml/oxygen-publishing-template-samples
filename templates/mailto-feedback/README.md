# Send Feedback Email
This template adds a link in footer to send feedback emails.

Using an additional JavaScript processing the link is updated with mailto, a generic address and the Publication Name and the Breadcrumb path as email Subject. The final result being:
```
<div class="mail_feedback">
  <span>
    <a href="mailto:someone@oxygenxml.com?subject=Map%20-%20Path%20%2F%20To%20%2F%20Topic">Give us feedback</a>
  </span>
</div>
```  