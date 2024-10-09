;; sequence(s): A89146
;; terms: 4 1 8 1 4 1 8 1 4 1 8 1 4 1 8 1 4 1 8 1
;; small program: if (x mod 2) <= 0 then (2 * ((x mod (2 + 2)) + 2)) else 1
;; fast program: 1 + (((1 + x) * (1 + (2 + x))) mod (2 * (2 + 2)))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (ite (<= (modf x 2) 0) (* 2 (+ (modf x (+ 2 2)) 2)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (modf (* (+ 1 x) (+ 1 (+ 2 x))) (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
