Gem::Specification.new do |s|
  s.name = "ties"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas R. Koll"]
  s.date = "2011-09-26"
  s.description = "Provides a ruby interface to the TIEScloud API"
  s.summary = "Provides a ruby interface to the TIEScloud API"
  s.email = "info@ananasblau.com"
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "Gemfile",
    "LICENSE",
    "README",
    "lib/ties.rb",
    "lib/ties/base.rb",
    "lib/ties/schedule.rb",
    "lib/ties/my_view.rb",
    "lib/ties/schools.rb",
    "lib/ties/students.rb",
    "lib/ties/teachers.rb",
    "spec/spec_helper.rb",
    "spec/ties/base_spec.rb",
    "spec/ties/schedule_spec.rb",
    "spec/ties/my_view_spec.rb",
    "spec/ties/schools_spec.rb",
    "spec/ties/students_spec.rb",
    "spec/ties/ties_spec.rb",
    "ties.gemspec"
    ]
end
