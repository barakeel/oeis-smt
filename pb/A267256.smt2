;; sequence(s): A267256
;; terms: 1 1 1 1 1 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1
;; small program: (if (2 + (2 - (x div 2))) <= 0 then x else 1) mod 2
;; fast program: loop(1, (2 * (2 + 2)) - x, x) mod 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (modf (ite (<= (+ 2 (- 2 (divf x 2))) 0) x 1) 2))))
(assert (= f0 1))
(assert (forall ((x Int)) (= (g0 x) (- (* 2 (+ 2 2)) x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (modf (v0 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
