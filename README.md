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

## updating this doc for a new openstack release

1. Make sure to make your changes on the master branch
2. Update the releaseinfo element in bk-deployment-ops-guide.xml
3. Update the abstract text to refer to the intended release in bk-deployment-ops-guide.xml
4. Update the version history in bk-deployment-ops-guide.xml
5. Update the version element in pom.xml to contain the release name (e.g. juno) in all lowercase characters
6. Make all text changes required
7. Once you're ready to "cut the release branch":

1. Create a new annotated git tag with the name of the release (e.g. juno) in all lowercase characters (this is used to dynamically generate lists and info on the landing page)
2. Make a new branch from 'master' with the name 'stable/juno' (where juno is the name of the release)
