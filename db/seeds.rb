# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ForwardRecord.create(rdtype: 'NS', name: DomainSuffix, rdata: NSServerName)
ReverseRecord.create(rdtype: 'NS', name: ReverseIPv4,  rdata: NSServerName)

ForwardRecord.create(rdtype: 'SOA', name: DomainSuffix, rdata: 'hoge.com. hoge.com. 1 28800 7200 2419200 86400')
ReverseRecord.create(rdtype: 'SOA', name: ReverseIPv4,  rdata: 'hoge.com. hoge.com. 1 28800 7200 2419200 86400')

Record.create(ip: 1, domain: 'aaa')
