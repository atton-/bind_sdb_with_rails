class Record < ActiveRecord::Base
  validates_presence_of   :ip, :domain
  validates_uniqueness_of :ip, :domain
  validates_inclusion_of  :ip, in: 1..254

  has_one :forward_record, dependent: :destroy
  has_one :reverse_record, dependent: :destroy

  def ipv4
    IPAddr.new(IPv4Prefix + ip.to_s)
  end

  def fqdn
    [domain, DomainSuffix].join('.')
  end

  after_save do
    v4 = ipv4
    create_forward_record(rdtype: 'A',   name: fqdn, rdata: v4)
    create_reverse_record(rdtype: 'PTR', name: v4.reverse, rdata: fqdn)
  end
end
