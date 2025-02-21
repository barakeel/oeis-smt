;; sequence(s): A194225
;; terms: 0 0 0 1 2 3 3 3 3 3 4 5 6 6 6 6 6 7 8 9
;; small program: loop((((x + y) div (2 + 2)) - x) + y, x + x, 0) - x
;; fast program: ((((((((((((((((((((((((1 + (2 + x)) div (1 + (2 + (2 + 2)))) + (if x <= 0 then 1 else x)) + x) * 2) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) * (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) * 2) + 1) + x) div (1 + 2)) - x) + x) mod (if x <= 0 then 1 else x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- (divf (+ x y) (+ 2 2)) x) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (modf (+ (- (divf (+ (+ (* (+ (divf (+ (+ (* (* (+ (+ (divf (+ (+ (* (+ (* (+ (+ (divf (+ 1 (+ 2 x)) (+ 1 (+ 2 (+ 2 2)))) (ite (<= x 0) 1 x)) x) 2) x) 2) 1) x) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) 2) 1) x) (+ 1 2)) x) x) (ite (<= x 0) 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
