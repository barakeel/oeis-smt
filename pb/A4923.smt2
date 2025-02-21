;; sequence(s): A4923
;; terms: 0 46 93 140 187 234 281 328 375 422 469 516 563 610 657 704 751 798 845 892
;; small program: (0 - x) mod ((2 * loop(x * y, 2 + 2, x)) - 1)
;; fast program: ((2 * (2 * (2 * (2 * ((x + x) + x))))) - (if x <= 0 then 0 else 1)) - x
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* x y))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (modf (- 0 x) (- (* 2 (v0 x)) 1)))))
(assert (forall ((x Int)) (= (fast x) (- (- (* 2 (* 2 (* 2 (* 2 (+ (+ x x) x))))) (ite (<= x 0) 0 1)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
