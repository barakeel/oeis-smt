;; sequence(s): A236677
;; terms: 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0 1 0
;; small program: (1 + ((x div 2) div 2)) mod (2 - (x mod 2))
;; fast program: if (((2 - x) * x) mod (2 * (2 * (2 + 2)))) <= 0 then 1 else 0
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (modf (+ 1 (divf (divf x 2) 2)) (- 2 (modf x 2))))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (modf (* (- 2 x) x) (* 2 (* 2 (+ 2 2)))) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
