let project = new Project('fluid bodies - qn');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('qn');
resolve(project);