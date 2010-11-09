virtualenv "/home/docs/sites/readthedocs.org" do
    owner "docs"
    group "docs"
    mode 0775
end

git "/home/docs/sites/readthedocs.org/checkouts/readthedocs.org" do
  repository "git://github.com/rtfd/readthedocs.org.git"
  reference "HEAD"
  user "docs"
  group "docs"
  action :sync
end

script "Install Requirements" do
  interpreter "bash"
  user "docs"
  group "docs"
  code <<-EOH
  /home/docs/sites/readthedocs.org/bin/pip install -r /home/docs/sites/readthedocs.org/checkouts/readthedocs.org/deploy_requirements.txt
  EOH
end
