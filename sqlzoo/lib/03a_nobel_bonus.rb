# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT DISTINCT
      n_phys.yr,
      n_chem.yr
    FROM
      nobels n_phys
    JOIN
      nobels n_chem ON (n_phys.yr = n_chem.yr)
    WHERE
      n_phys.subject = 'Physics' AND n_chem.subject = 'Chemistry'
    ORDER BY
      n_phys.yr ASC;
  SQL
end
