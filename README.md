NetApp OpenStack Deployment & Operations Guide
===============================================
You must have Maven (and a JDK) installed, and the first time you run mvn you will need internet connectivity to download requisite dependencies. 

to build, run:

mvn clean generate-resources

If successful, the PDF output will be in target/docbkx/pdf/bk-deployment-ops-guide.pdf; HTML output in target/docbkx/webhelp/bk-deployment-ops-guide-external/

TODO:

- add spell check as part of build process
- post resulting PDF to destination site
- post resulting HTML to destination site
- add instructions to rev version number of document
