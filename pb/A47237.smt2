;; sequence(s): A47237
;; terms: 0 1 2 4 6 7 8 10 12 13 14 16 18 19 20 22 24 25 26 28
;; small program: ((x - ((x div 2) mod 2)) div 2) + x
;; fast program: ((x - (if (x mod (2 + 2)) <= 0 then 0 else 1)) div 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (divf (- x (modf (divf x 2) 2)) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (- x (ite (<= (modf x (+ 2 2)) 0) 0 1)) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
