NetApp OpenStack Deployment & Operations Guide
===============================================
You must have Maven (and a JDK) installed, and the first time you run mvn you will need internet connectivity to download requisite dependencies. 

to build, run:

mvn clean generate-resources

If successful, the PDF output will be in target/docbkx/pdf/bk-deployment-ops-guide.pdf

TODO:

- add spell check as part of build process
- post resulting PDF to destination site
- add instructions to rev version number of document
- add Trove, Sahara to core list in Section 2
