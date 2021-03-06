(in-package :crane-test.postgres)

(test create-table
  (finishes
   (deftable table-with-time ()
     (field :type timestamp))))

(test (queries :depends-on create-table)
  (is-true
   (let* ((timestamp (local-time:today))
          (instance (create 'table-with-time
                            :field timestamp))
          (found-instance
            (single 'table-with-time :field timestamp)))
     (local-time:timestamp= timestamp
                            (field found-instance)))))
