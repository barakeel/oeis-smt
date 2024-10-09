;; sequence(s): A95721
;; terms: 1 2 3 5 4 7 6 10 8 13 9 15 11 18 12 20 14 23 16 26
;; small program: (((((((((((x div 2) div 2) + (x mod 2)) + x) div 2) + x) + 1) + x) - x) + 1) + (if (x mod 2) <= 0 then 1 else x)) div 2
;; fast program: ((((((((((if (x mod 2) <= 0 then 1 else (x + x)) + x) + (x div (2 + 2))) + 2) - x) + 1) + x) div 2) + 1) + x) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (+ (+ (- (+ (+ (+ (divf (+ (+ (divf (divf x 2) 2) (modf x 2)) x) 2) x) 1) x) x) 1) (ite (<= (modf x 2) 0) 1 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (+ (divf (+ (+ (- (+ (+ (+ (ite (<= (modf x 2) 0) 1 (+ x x)) x) (divf x (+ 2 2))) 2) x) 1) x) 2) 1) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
