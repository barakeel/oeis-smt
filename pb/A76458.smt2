;; sequence(s): A76458
;; terms: 17 165 678 1910 4335 8547 15260 25308 39645 59345 85602 119730 163163 217455 284280 365432 462825 578493 714590 873390
;; small program: ((((loop((x + x) + x, 2, 2 + x) + x) * (1 + x)) - 1) * ((2 + x) * (1 + x))) div 2
;; fast program: (((1 + (((((2 * (2 + 2)) * (1 + x)) + x) + x) * (2 + x))) * (2 + x)) * (1 + x)) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ x x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (* (- (* (+ (v0 x) x) (+ 1 x)) 1) (* (+ 2 x) (+ 1 x))) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (* (* (+ 1 (* (+ (+ (* (* 2 (+ 2 2)) (+ 1 x)) x) x) (+ 2 x))) (+ 2 x)) (+ 1 x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
