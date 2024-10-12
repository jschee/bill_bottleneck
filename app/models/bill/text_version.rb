class Bill::TextVersion < ApplicationRecord
  belongs_to :bill

  # Not sure, but could be useful to know TYPES mapping later.
  # The short codes are used in congress gov search engine.
  TYPES = {
    'AS' => 'Amendment Ordered to be Printed',
    'ASH' => 'Additional Sponsors House',
    'ATH' => 'Agreed to House',
    'ATS' => 'Agreed to Senate',
    'CDH' => 'Committee Discharged House',
    'CDS' => 'Committee Discharged Senate',
    'CPH' => 'Considered and Passed House',
    'CPS' => 'Considered and Passed Senate',
    'EAH' => 'Engrossed Amendment House',
    'EAS' => 'Engrossed Amendment Senate',
    'EH' => 'Engrossed in House',
    'ENR' => 'Enrolled',
    'ES' => 'Engrossed in Senate',
    'FPH' => 'Failed Passage House',
    'FPS' => 'Failed Passage Senate',
    'HDS' => 'Held at Desk Senate',
    'IH' => 'Introduced in House',
    'IPH' => 'Indefinitely Postponed (House)',
    'IPS' => 'Indefinitely Postponed Senate',
    'IS' => 'Introduced in Senate',
    'LTH' => 'Laid on Table in House',
    'LTS' => 'Laid on Table in Senate',
    'PAP' => 'Printed as Passed',
    'PCS' => 'Placed on Calendar Senate',
    'PP' => 'Public Print',
    'PVTL' => 'Private Law',
    'PL' => 'Public Law',
    'RCH' => 'Reference Change House',
    'RCS' => 'Reference Change Senate',
    'RDS' => 'Received in Senate',
    'RFH' => 'Referred in House',
    'RFS' => 'Referred in Senate',
    'RH' => 'Reported in House',
    'RHUC' => 'Returned to the House by Unanimous Consent',
    'RIH' => 'Referral Instructions House',
    'RS' => 'Reported to Senate',
    'RTH' => 'Referred to Committee House',
    'RTS' => 'Referred to Committee Senate',
    'SC' => 'Sponsor Change',
    'STATPVT' => 'Statutes at Large (Private Law)',
    'STAT' => 'Statutes at Large (Public Law)'
  }.freeze
end
