let project = new Project('one way platforms - qn');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('qn');
resolve(project);