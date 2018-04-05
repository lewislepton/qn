let project = new Project('multi shape - qn');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('qn');
resolve(project);
