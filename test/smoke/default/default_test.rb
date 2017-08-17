describe package("mongodb-org") do
  it { should be_installed } # the package should be installed
end

describe port(27017) do
  it { should be_listening } # should be listening on this port
end

describe service("mongod") do
  it { should be_running } # the package should be installed
end

describe service("mongod") do
  it { should be_enabled } # the package should be installed
end
