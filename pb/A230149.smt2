;; sequence(s): A230149
;; terms: 0 0 0 0 0 1 1 1 2 1 2 2 3 3 2 3 4 4 4 3
;; small program: ((x div 2) div 2) - ((x mod (1 + (2 + 2))) div (2 + 2))
;; fast program: (if ((1 + x) mod (1 + (2 + 2))) <= 0 then 1 else 2) + ((x div (2 + 2)) - 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (divf (divf x 2) 2) (divf (modf x (+ 1 (+ 2 2))) (+ 2 2))))))
(assert (forall ((x Int)) (= (fast x) (+ (ite (<= (modf (+ 1 x) (+ 1 (+ 2 2))) 0) 1 2) (- (divf x (+ 2 2)) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
